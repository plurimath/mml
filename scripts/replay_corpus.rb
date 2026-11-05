# frozen_string_literal: true

# Replays the plurimath-testsuite mathml stage generation pinned in
# spec/fixtures/testsuite-pin.yml at the gem's own boundary, model-roundtrip.
#
# Usage:
#   bundle exec ruby scripts/replay_corpus.rb --testsuite PATH [--pin FILE] \
#     [--language mathml] [--generation N] [--report FILE]
#
# Before any row runs it checks the pin: its schema and fields, that the
# checkout is at the pinned commit with no uncommitted stage files, that the
# ledger has the pinned generation with the pinned snapshot digest, that the
# digest recomputed from the generation's files is the same and that every
# payload has its recorded checksum. --language and --generation, when given,
# must equal the pin's. Then every row of every model-roundtrip payload is
# parsed with Mml.parse, its model written in the canonical tagged form that
# the testsuite's scripts/generate-xml-stage-cases.rb writes, serialized with
# to_xml, and the outcome (or the refusal) must equal the row's expected
# value. Payloads at other boundaries (the facade-output rows) are skipped.
# Any pin failure, any difference or a generation with no model-roundtrip
# rows exits 1.

require "bigdecimal"
require "digest"
require "fileutils"
require "json"
require "open3"
require "optparse"
require "yaml"
require "mml"

module MmlReplayCorpus
  class Error < StandardError; end

  ROOT = File.expand_path("..", __dir__)
  DEFAULT_PIN = File.join(ROOT, "spec", "fixtures", "testsuite-pin.yml")
  PIN_SCHEMA = "plurimath-stage/pin/1"
  PIN_KEYS = %w[schema repository commit language generation
                snapshot_digest].freeze
  REPOSITORY = "https://github.com/plurimath/plurimath-testsuite"
  LANGUAGE = "mathml"
  BOUNDARY = "model-roundtrip"
  RUN_OPTIONS = %i[language generation report].freeze
  OPTIONS = [
    [:testsuite, "--testsuite PATH"], [:pin, "--pin FILE"],
    [:language, "--language NAME"], [:generation, "--generation N", Integer],
    [:report, "--report FILE"]
  ].freeze

  # Each pin field's check, in order, with the message when it fails.
  PIN_CHECKS = [
    ["schema", ->(v) { v == PIN_SCHEMA },
     ->(_) { "schema is not #{PIN_SCHEMA}" }],
    ["repository", ->(v) { v == REPOSITORY },
     ->(_) { "repository is not #{REPOSITORY}" }],
    ["commit", ->(v) { v.is_a?(String) && v.match?(/\A\h{40}\z/) },
     ->(_) { "commit is not a 40-hex commit" }],
    ["language", ->(v) { v == LANGUAGE },
     ->(v) { "language #{v.inspect} is not #{LANGUAGE}" }],
    ["generation", ->(v) { v.is_a?(Integer) && v >= 1 },
     ->(_) { "generation is not a positive integer" }],
    ["snapshot_digest",
     ->(v) { v.is_a?(String) && v.match?(/\Asha256:\h{64}\z/) },
     ->(_) { "snapshot_digest is not sha256:<64 hex>" }],
  ].freeze

  Pin = Struct.new(:commit, :language, :generation, :digest,
                   keyword_init: true)

  module_function

  # The pin at +path+, its fields checked against plurimath-stage/pin/1.
  def load_pin(path)
    doc = YAML.safe_load_file(path, aliases: false)
    raise Error, "#{path}: not a mapping" unless doc.is_a?(Hash)

    check_pin_keys(path, doc)
    check_pin_fields(path, doc)
    Pin.new(commit: doc["commit"], language: doc["language"],
            generation: doc["generation"], digest: doc["snapshot_digest"])
  rescue Psych::Exception, Errno::ENOENT => e
    raise Error, "#{path}: #{e.message}"
  end

  def check_pin_fields(path, doc)
    PIN_CHECKS.each do |key, valid, message|
      next if valid.call(doc[key])

      raise Error, "#{path}: #{message.call(doc[key])}"
    end
  end

  def check_pin_keys(path, doc)
    missing = PIN_KEYS - doc.keys
    extra = doc.keys - PIN_KEYS
    raise Error, "#{path}: missing #{missing.join(', ')}" unless missing.empty?
    raise Error, "#{path}: unknown keys #{extra.join(', ')}" unless extra.empty?
  end

  def git(dir, *args)
    out, err, status = Open3.capture3("git", "-C", dir, *args)
    unless status.success?
      raise Error, "git #{args.join(' ')} in #{dir}: #{err.strip}"
    end

    out.strip
  end

  # The testsuite's snapshot digest of a generation's { path => bytes }.
  def snapshot_digest(files)
    lines = files.sort_by { |path, _| path.b }.map do |path, bytes|
      "#{Digest::SHA256.hexdigest(bytes)}  #{path}\n"
    end
    "sha256:#{Digest::SHA256.hexdigest(lines.join.encode('UTF-8'))}"
  end

  # [generation dir, { payload path => bytes }] once the checkout matches +pin+.
  def verify(testsuite, pin)
    check_checkout(testsuite, pin)
    entry = ledger_entry(testsuite, pin)
    files = generation_files(testsuite, entry, pin)
    listed = check_provenance(entry, files)
    [entry["path"], listed.to_h { |p| [p["path"], files.fetch(p["path"])] }]
  rescue KeyError, Psych::Exception => e
    raise Error, e.message
  end

  def check_checkout(testsuite, pin)
    head = git(testsuite, "rev-parse", "HEAD")
    unless head == pin.commit
      raise Error, "pin commit #{pin.commit} is not the checkout's HEAD #{head}"
    end

    dirty = git(testsuite, "status", "--porcelain", "--", "stages",
                "generations")
    return if dirty.empty?

    raise Error, "testsuite checkout has uncommitted stage files:\n#{dirty}"
  end

  def ledger_entry(testsuite, pin)
    ledger_path = File.join(testsuite, "generations", "#{pin.language}.yaml")
    raise Error, "#{ledger_path} does not exist" unless File.file?(ledger_path)

    entries = YAML.safe_load_file(ledger_path, aliases: false).fetch("entries")
    entry = entries.find { |e| e["generation"] == pin.generation }
    unless entry
      raise Error, "generations/#{pin.language}.yaml has no generation " \
                   "#{pin.generation}"
    end
    check_ledger_digest(entry, pin)
    entry
  end

  def check_ledger_digest(entry, pin)
    return if entry["snapshot_digest"] == pin.digest

    raise Error, "ledger digest #{entry['snapshot_digest']} of generation " \
                 "#{pin.generation} is not the expected #{pin.digest}"
  end

  # { path => bytes } of the generation's files, its digest checked.
  def generation_files(testsuite, entry, pin)
    dir = File.join(testsuite, entry.fetch("path"))
    files = generation_paths(dir, entry).to_h do |p|
      [p, File.binread(File.join(dir, p))]
    end
    digest = snapshot_digest(files)
    return files if digest == pin.digest

    raise Error, "#{entry['path']}: digest #{digest} does not match the " \
                 "ledger's #{pin.digest}"
  end

  # The generation's file paths, none of them a symlink.
  def generation_paths(dir, entry)
    paths = Dir.glob("**/*", File::FNM_DOTMATCH, base: dir)
    paths = paths.reject { |p| File.directory?(File.join(dir, p)) }
    paths.each do |p|
      next unless File.symlink?(File.join(dir, p))

      raise Error, "#{entry['path']}/#{p} is a symlink"
    end
    paths
  end

  # The provenance's payload list, checked against the generation's files.
  def check_provenance(entry, files)
    provenance = YAML.safe_load(files.fetch("provenance.yaml") do
      raise Error, "#{entry['path']} has no provenance.yaml"
    end)
    listed = provenance.fetch("payloads")
    check_listed(entry, files, listed)
    listed.each { |p| check_checksum(entry, files, p) }
    listed
  end

  def check_listed(entry, files, listed)
    payload_paths = (files.keys - ["provenance.yaml"]).sort
    return if listed.map { |p| p["path"] }.sort == payload_paths

    raise Error, "#{entry['path']}: provenance does not list exactly the " \
                 "payload files"
  end

  def check_checksum(entry, files, payload)
    actual = Digest::SHA256.hexdigest(files.fetch(payload["path"]))
    return if actual == payload["sha256"]

    raise Error, "#{entry['path']}/#{payload['path']}: sha256 #{actual} " \
                 "is not #{payload['sha256']}"
  end

  # Every model-roundtrip row of the generation, with its payload path.
  def roundtrip_rows(payloads)
    payloads.flat_map do |rel, bytes|
      doc = YAML.safe_load(bytes, aliases: false)
      next [] unless doc["boundary"] == BOUNDARY

      doc.fetch("cases").map { |row| [rel, row] }
    end
  end

  def decode(row, where)
    value = row.fetch("input")
    unless canonical?(value)
      raise Error, "#{where}: input is not a canonical string"
    end
    unless row.fetch("options", {}).empty?
      raise Error,
            "#{where}: unsupported options #{row['options'].keys.join(', ')}"
    end

    value["str"]
  end

  def canonical?(value)
    value.is_a?(Hash) && value.keys == ["str"] && value["str"].is_a?(String)
  end

  SCALAR_TAGS = {
    NilClass => ->(_) { { "nil" => true } },
    TrueClass => ->(v) { { "bool" => v } },
    FalseClass => ->(v) { { "bool" => v } },
    Integer => ->(v) { { "int" => v.to_s } },
    Float => ->(v) { { "float" => v.inspect } },
    BigDecimal => ->(v) { { "decimal" => v.to_s } },
    Symbol => ->(v) { { "sym" => v.to_s } },
  }.freeze

  # The canonical tagged form of docs/tree-parity-contract.adoc, as
  # scripts/generate-xml-stage-cases.rb writes it.
  def tag(value, path = [])
    case value
    when String then tag_string(value)
    when Array then { "array" => value.map { |v| tag(v, path) } }
    when Hash then tag_hash(value, path)
    when Lutaml::Model::Serializable then tag_model(value, path)
    else tag_scalar(value)
    end
  end

  def tag_scalar(value)
    _, tagger = SCALAR_TAGS.find { |klass, _| value.is_a?(klass) }
    raise Error, "no tagged form for #{value.class}" unless tagger

    tagger.call(value)
  end

  def tag_hash(value, path)
    { "hash" => value.map { |k, v| [tag(k, path), tag(v, path)] } }
  end

  def tag_string(value)
    if value.encoding == Encoding::UTF_8 && value.valid_encoding?
      { "str" => value.to_s }
    else
      { "bytes" => value.unpack1("H*"), "encoding" => value.encoding.name }
    end
  end

  def tag_model(model, path)
    if path.any? { |seen| seen.equal?(model) }
      raise Error, "cycle at #{model.class}"
    end

    fields = model_fields(model, path + [model])
    order = element_order(model)
    fields << ["@element_order", order] if order
    { "node" => model.class.name, "fields" => fields }
  end

  def element_order(model)
    order = model.element_order if model.respond_to?(:element_order)
    return if order.nil? || order.empty?

    { "array" => order.map { |e| tag_order(e) } }
  end

  def model_fields(model, inner)
    model.class.attributes.filter_map do |name, _attribute|
      next if model.using_default?(name)

      [name.to_s, tag(model.public_send(name), inner)]
    end
  end

  def tag_order(entry)
    pairs = [["type", entry.type], ["name", entry.name]]
    pairs << ["text", entry.text_content] if entry.node_type == :text
    { "hash" => pairs.map { |k, v| [{ "str" => k }, tag(v)] } }
  end

  def refusal(category, error)
    { "refusal" => { "category" => category,
                     "error_class" => error.class.name } }
  end

  # The row's outcome, in the form the stage payloads record.
  def outcome(input)
    begin
      model = Mml.parse(input)
    rescue StandardError => e
      return refusal("parse_error", e)
    end
    serialized_outcome(model)
  end

  def serialized_outcome(model)
    begin
      output = model.to_xml
    rescue StandardError => e
      return refusal("serialize_error", e)
    end
    { "model" => tag(model), "output" => tag_string(output) }
  end

  def replay(rows)
    rows.filter_map do |rel, row|
      actual = outcome(decode(row, "#{rel} #{row['id']}"))
      next if actual == row.fetch("expected")

      { "id" => row["id"], "payload" => rel, "expected" => row["expected"],
        "actual" => actual }
    end
  end

  # Options: language:, generation: (each must equal the pin's) and
  # report: (a file to write the summary to).
  def run(testsuite:, pin: DEFAULT_PIN, log: $stderr, **options)
    check_run_options(options)
    pinned = load_pin(pin)
    check_expected(pinned, options)
    rows, payloads = pinned_rows(testsuite, pinned)
    log.puts "pin ok: #{pinned.language} generation #{pinned.generation} " \
             "at #{pinned.commit}, #{pinned.digest}"
    summary = summarize(pinned, rows, payloads, replay(rows))
    write_report(options[:report], summary)
    finish(log, rows, summary)
  end

  def check_run_options(options)
    unknown = options.keys - RUN_OPTIONS
    return if unknown.empty?

    raise ArgumentError, "unknown keywords: #{unknown.join(', ')}"
  end

  def check_expected(pinned, options)
    language = options[:language]
    generation = options[:generation]
    if language && language != pinned.language
      raise Error, "--language #{language} is not the pinned #{pinned.language}"
    end
    return unless generation && generation != pinned.generation

    raise Error,
          "--generation #{generation} is not the pinned #{pinned.generation}"
  end

  def pinned_rows(testsuite, pinned)
    _dir, payloads = verify(File.expand_path(testsuite), pinned)
    rows = roundtrip_rows(payloads)
    return [rows, payloads] unless rows.empty?

    raise Error, "#{pinned.language} generation #{pinned.generation} has no " \
                 "#{BOUNDARY} rows"
  end

  def summarize(pinned, rows, payloads, failures)
    replayed = rows.map(&:first).uniq.size
    {
      "commit" => pinned.commit, "language" => pinned.language,
      "generation" => pinned.generation, "snapshot_digest" => pinned.digest,
      "gem_version" => Mml::VERSION,
      "#{BOUNDARY}_payloads" => replayed, "#{BOUNDARY}_rows" => rows.size,
      "refusal_rows" => rows.count { |_, row| row["expected"].key?("refusal") },
      "skipped_payloads" => payloads.size - replayed,
      "mismatched_rows" => failures.size, "failures" => failures
    }
  end

  def write_report(report, summary)
    return unless report

    FileUtils.mkdir_p(File.dirname(report))
    File.write(report, "#{JSON.pretty_generate(summary, max_nesting: false)}\n")
  end

  def finish(log, rows, summary)
    failures = summary["failures"]
    log.puts "#{rows.size} #{BOUNDARY} rows (#{summary['refusal_rows']} " \
             "refusals) from #{summary["#{BOUNDARY}_payloads"]} payloads, " \
             "#{summary['skipped_payloads']} other payloads skipped: " \
             "#{failures.size} differ"
    return summary if failures.empty?

    raise Error, "#{failures.size} rows differ: " \
                 "#{failures.map { |f| f['id'] }.join(', ')}"
  end

  def main(argv)
    options = parse_options(argv)
    run(**options)
    0
  rescue OptionParser::ParseError => e
    warn e.message
    2
  rescue Error => e
    warn "replay_corpus: #{e.message}"
    1
  end

  def parse_options(argv)
    options = {}
    option_parser(options).parse!(argv)
    unless options[:testsuite]
      raise OptionParser::MissingArgument, "--testsuite"
    end
    raise OptionParser::InvalidOption, argv.join(" ") unless argv.empty?

    options
  end

  def option_parser(options)
    OptionParser.new do |o|
      o.banner = "usage: scripts/replay_corpus.rb --testsuite PATH " \
                 "[--pin FILE] [--language NAME] [--generation N] " \
                 "[--report FILE]"
      OPTIONS.each do |key, *switch|
        o.on(*switch) { |v| options[key] = v }
      end
    end
  end
end

exit MmlReplayCorpus.main(ARGV) if $PROGRAM_NAME == __FILE__
