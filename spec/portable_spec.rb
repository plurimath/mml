# frozen_string_literal: true

require "json"
require "tmpdir"

RSpec.describe Mml::Portable do
  it "ships both full closed model graphs with verified bytes" do
    { 3 => 194, 4 => 195 }.each do |version, count|
      data = JSON.parse(described_class.bundle(version: version))
      expect(data.fetch("lml_bundle")).to eq(1)
      expect(data.fetch("models").size).to eq(count)
      expect(data.fetch("roots")).to eq(["Mml::V#{version}::Math@mml_v#{version}"])
    end
  end

  it "refuses unsupported portable versions explicitly" do
    expect { described_class.bundle(version: 2) }.to raise_error(ArgumentError, /supported: 3, 4/)
  end

  it "refuses changed bundle bytes" do
    manifest = described_class.manifest
    Dir.mktmpdir("mml-portable") do |directory|
      File.write(File.join(directory, "manifest.json"), JSON.generate(manifest))
      File.write(File.join(directory, "mathml-v3.bundle.json"), "{}")
      stub_const("Mml::Portable::DIRECTORY", directory)
      expect { described_class.bundle }.to raise_error(Mml::Portable::ArtifactError, /checksum mismatch/)
    end
  end
end
