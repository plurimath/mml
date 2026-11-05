# frozen_string_literal: true

require "digest"
require "fileutils"
require "json"
require "stringio"
require "tmpdir"
require "yaml"
require_relative "../../scripts/replay_corpus"

# scripts/replay_corpus.rb --testsuite: the pin checks and the
# model-roundtrip replay, against a small testsuite checkout built in a
# temporary git repository.
RSpec.describe "scripts/replay_corpus.rb" do # rubocop:disable RSpec/DescribeClass
  def corpus
    MmlReplayCorpus
  end

  def pin_file
    File.expand_path("../fixtures/testsuite-pin.yml", __dir__)
  end

  let(:inputs) { ["<math><mi>a</mi></math>", "<math><mn>1</mn><mo>+</mo><mi>x</mi></math>"] }
  let(:rows) do
    inputs.each_with_index.map do |input, i|
      { "id" => "row-#{i}.model-roundtrip", "input" => { "str" => input }, "options" => {},
        "expected" => corpus.outcome(input) }
    end
  end

  # A testsuite checkout with one mathml generation: a facade-output
  # payload, which the replay skips, and a model-roundtrip payload of
  # +cases+. Returns [commit, snapshot digest].
  def build_testsuite(dir, cases)
    gen = File.join(dir, "stages/mathml/generations/000001")
    FileUtils.mkdir_p(File.join(gen, "payloads"))
    payloads = {
      "payloads/sample.yaml" => YAML.dump("schema" => "plurimath-corpus/mathml/1", "group" => "sample",
                                          "cases" => [{ "id" => "sample-001", "input" => "x" }]),
      "payloads/model-roundtrip-sample.yaml" => YAML.dump("schema" => "plurimath-stage/mathml/cases/1",
                                                          "group" => "model-roundtrip-sample",
                                                          "boundary" => "model-roundtrip", "cases" => cases),
    }
    payloads.each { |path, bytes| File.binwrite(File.join(gen, path), bytes) }
    provenance = YAML.dump(
      "schema" => "plurimath-stage/provenance/1", "language" => "mathml", "generation" => 1,
      "payloads" => payloads.sort.map { |path, bytes| { "path" => path, "sha256" => Digest::SHA256.hexdigest(bytes) } }
    )
    File.binwrite(File.join(gen, "provenance.yaml"), provenance)
    digest = corpus.snapshot_digest(payloads.merge("provenance.yaml" => provenance))
    FileUtils.mkdir_p(File.join(dir, "generations"))
    ledger = { "schema" => "plurimath-stage/ledger/1", "language" => "mathml", "layout" => 1,
               "entries" => [{ "generation" => 1, "path" => "stages/mathml/generations/000001",
                               "snapshot_digest" => digest }] }
    File.binwrite(File.join(dir, "generations/mathml.yaml"), YAML.dump(ledger))
    git = ["git", "-C", dir, "-c", "user.name=t", "-c", "user.email=t@example.com"]
    system("git", "init", "-q", dir, exception: true)
    system(*git, "add", ".", exception: true)
    system(*git, "commit", "-qm", "t", exception: true)
    [corpus.git(dir, "rev-parse", "HEAD"), digest]
  end

  def write_pin(path, **fields)
    pin = { "schema" => "plurimath-stage/pin/1", "repository" => "https://github.com/plurimath/plurimath-testsuite",
            "commit" => nil, "language" => "mathml", "generation" => 1, "snapshot_digest" => nil }
    File.binwrite(path, YAML.dump(pin.merge(fields.transform_keys(&:to_s)).compact))
    path
  end

  def run_replay(testsuite, pin, **options)
    corpus.run(testsuite: testsuite, pin: pin, log: StringIO.new, **options)
  end

  def with_testsuite(cases = rows)
    Dir.mktmpdir do |dir|
      testsuite = File.join(dir, "testsuite")
      commit, digest = build_testsuite(testsuite, cases)
      yield dir, testsuite, commit, digest
    end
  end

  describe "the committed pin" do
    it "names mathml generation 2 at an exact testsuite commit" do
      expect(corpus.load_pin(pin_file)).to have_attributes(
        language: "mathml", generation: 2, commit: match(/\A\h{40}\z/),
        digest: match(/\Asha256:\h{64}\z/)
      )
    end
  end

  describe ".load_pin" do
    let(:good) { { commit: "a" * 40, snapshot_digest: "sha256:#{'0' * 64}" } }
    let(:malformed) do
      {
        "schema" => { schema: "plurimath-stage/pin/2" },
        "repository" => { repository: "https://github.com/plurimath/plurimath" },
        "commit" => { commit: "337262e" },
        "language" => { language: "latex" },
        "generation" => { generation: 0 },
        "snapshot_digest" => { snapshot_digest: "53943ace" },
        "missing" => { snapshot_digest: nil },
      }
    end

    it "loads a well-formed pin" do
      Dir.mktmpdir do |dir|
        pin = write_pin(File.join(dir, "ok.yml"), **good)
        expect(corpus.load_pin(pin).generation).to eq(1)
      end
    end

    it "refuses a pin with a missing or malformed field" do
      Dir.mktmpdir do |dir|
        malformed.each do |name, change|
          path = write_pin(File.join(dir, "#{name}.yml"), **good, **change)
          expect { corpus.load_pin(path) }
            .to raise_error(corpus::Error), name
        end
      end
    end

    it "refuses a pin with an unknown field" do
      Dir.mktmpdir do |dir|
        ok = YAML.load_file(write_pin(File.join(dir, "ok.yml"), **good))
        File.binwrite(File.join(dir, "extra.yml"), YAML.dump(ok.merge("x" => 1)))
        expect { corpus.load_pin(File.join(dir, "extra.yml")) }
          .to raise_error(corpus::Error, /unknown keys x/)
      end
    end
  end

  describe ".run" do
    it "replays every model-roundtrip row and skips other payloads when the pin matches" do
      with_testsuite do |dir, testsuite, commit, digest|
        pin = write_pin(File.join(dir, "pin.yml"), commit: commit, snapshot_digest: digest)
        summary = run_replay(testsuite, pin, language: "mathml", generation: 1)
        expect(summary.values_at("model-roundtrip_payloads", "model-roundtrip_rows", "skipped_payloads",
                                 "mismatched_rows")).to eq([1, 2, 1, 0])
      end
    end

    it "fails when the pinned commit is not the checkout's HEAD" do
      with_testsuite do |dir, testsuite, _commit, digest|
        pin = write_pin(File.join(dir, "pin.yml"), commit: "0" * 40, snapshot_digest: digest)
        expect { run_replay(testsuite, pin) }.to raise_error(corpus::Error, /is not the checkout's HEAD/)
      end
    end

    it "fails when the pinned digest is not the generation's" do
      with_testsuite do |dir, testsuite, commit, _digest|
        pin = write_pin(File.join(dir, "pin.yml"), commit: commit, snapshot_digest: "sha256:#{'0' * 64}")
        expect { run_replay(testsuite, pin) }.to raise_error(corpus::Error, /is not the expected sha256:0{64}/)
      end
    end

    it "fails when a committed generation file no longer matches the ledger digest" do
      with_testsuite do |dir, testsuite, commit, digest|
        File.open(File.join(testsuite, "stages/mathml/generations/000001/payloads/sample.yaml"), "ab") { |io| io.write("x\n") }
        system("git", "-C", testsuite, "-c", "user.name=t", "-c", "user.email=t@example.com",
               "commit", "-qam", "tamper", exception: true)
        head = corpus.git(testsuite, "rev-parse", "HEAD")
        expect(head).not_to eq(commit)
        pin = write_pin(File.join(dir, "pin.yml"), commit: head, snapshot_digest: digest)
        expect { run_replay(testsuite, pin) }.to raise_error(corpus::Error, /does not match the ledger's/)
      end
    end

    it "fails when the checkout has uncommitted stage files" do
      with_testsuite do |dir, testsuite, commit, digest|
        File.open(File.join(testsuite, "stages/mathml/generations/000001/payloads/sample.yaml"), "ab") { |io| io.write("x\n") }
        pin = write_pin(File.join(dir, "pin.yml"), commit: commit, snapshot_digest: digest)
        expect { run_replay(testsuite, pin) }.to raise_error(corpus::Error, /uncommitted stage files/)
      end
    end

    it "fails when the pinned generation is not in the ledger" do
      with_testsuite do |dir, testsuite, commit, digest|
        pin = write_pin(File.join(dir, "pin.yml"), commit: commit, generation: 2, snapshot_digest: digest)
        expect { run_replay(testsuite, pin) }.to raise_error(corpus::Error, /has no generation 2/)
      end
    end

    it "fails when the caller expects another generation or language than the pin's" do
      with_testsuite do |dir, testsuite, commit, digest|
        pin = write_pin(File.join(dir, "pin.yml"), commit: commit, snapshot_digest: digest)
        expect { run_replay(testsuite, pin, generation: 2) }
          .to raise_error(corpus::Error, /--generation 2 is not the pinned 1/)
        expect { run_replay(testsuite, pin, language: "latex") }
          .to raise_error(corpus::Error, /--language latex is not the pinned mathml/)
      end
    end

    it "fails and reports the row when an outcome differs from the expected value" do
      changed = rows.dup
      changed[1] = changed[1].merge("expected" => Marshal.load(Marshal.dump(rows[0]["expected"])))
      with_testsuite(changed) do |dir, testsuite, commit, digest|
        pin = write_pin(File.join(dir, "pin.yml"), commit: commit, snapshot_digest: digest)
        report = File.join(dir, "report.json")
        expect { run_replay(testsuite, pin, report: report) }
          .to raise_error(corpus::Error, /1 rows differ: row-1\.model-roundtrip/)
        expect(JSON.parse(File.read(report)).fetch("failures").map { |f| f["id"] }).to eq(["row-1.model-roundtrip"])
      end
    end

    it "fails when the generation has no model-roundtrip rows" do
      with_testsuite([]) do |dir, testsuite, commit, digest|
        pin = write_pin(File.join(dir, "pin.yml"), commit: commit, snapshot_digest: digest)
        expect { run_replay(testsuite, pin) }.to raise_error(corpus::Error, /has no model-roundtrip rows/)
      end
    end
  end
end
