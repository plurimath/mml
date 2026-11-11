# frozen_string_literal: true

# Export the actual versioned model graphs through the upstream LML API.
require "json"
require "digest"
require "fileutils"
require "open3"
$stdout.sync = true

ROOT = File.expand_path("..", __dir__)
FRAMEWORK_REVISION = "fd2989fd8478b1ecb2508d98fa2d66792c09c72b"
MODEL_SOURCE_REVISION = "a88197810737e7eb809bbb5f887703a25beac3db"
framework = ENV.fetch("LUTAML_MODEL_SOURCE") do
  abort "set LUTAML_MODEL_SOURCE to the pinned upstream source checkout"
end
revision, status = Open3.capture2("git", "-C", framework, "rev-parse", "HEAD")
abort "unexpected model framework revision" unless status.success? && revision.strip == FRAMEWORK_REVISION
changes, status = Open3.capture2("git", "-C", framework, "status", "--porcelain")
abort "the model framework checkout must be clean" unless status.success? && changes.empty?
$LOAD_PATH.unshift(File.join(File.expand_path(framework), "lib"))
$LOAD_PATH.unshift(File.join(ROOT, "lib"))
require "mml"
require "mml/version"
require "lutaml/model/lml"

abort "usage: ruby scripts/export_portable_models.rb OUTPUT_DIRECTORY" unless ARGV.length == 1
abort "the portable LML bundle API is unavailable" unless Lutaml::Model::Lml.respond_to?(:export_bundle)
if framework
  source = Lutaml::Model::Lml.method(:export_bundle).source_location.first
  expected = File.join(File.expand_path(framework), "lib/lutaml/model/lml.rb")
  abort "a different model framework was loaded" unless File.realpath(source) == File.realpath(expected)
end

output = File.expand_path(ARGV.first)
FileUtils.mkdir_p(output)
manifest = {
  "format" => "mml-portable-models/1",
  "source_repository" => "https://github.com/plurimath/mml",
  "source_revision" => MODEL_SOURCE_REVISION,
  "source_version" => Mml::VERSION,
  "framework_repository" => "https://github.com/lutaml/lutaml-model",
  "framework_revision" => FRAMEWORK_REVISION,
  "framework_status" => "open candidate; not a released dependency",
  "versions" => {},
}

[3, 4].each do |version|
  namespace = Mml.const_get("V#{version}")
  config = namespace::Configuration
  config.populate_context! unless config.context
  register = config.context_id
  bundle = Lutaml::Model::Lml.export_bundle(namespace::Math, register: register)
  bytes = "#{JSON.generate(bundle.to_h)}\n"
  filename = "mathml-v#{version}.bundle.json"
  File.write(File.join(output, filename), bytes)
  manifest["versions"][version.to_s] = {
    "path" => filename,
    "sha256" => Digest::SHA256.hexdigest(bytes),
    "bundle_checksum" => bundle.checksum,
    "models" => bundle.to_h.fetch("models").size,
    "root" => bundle.to_h.fetch("roots").first,
    "capabilities" => bundle.to_h.fetch("capabilities"),
  }
  puts "MathML #{version}: #{manifest['versions'][version.to_s]['models']} models, #{bundle.checksum}"
end
File.write(File.join(output, "manifest.json"), "#{JSON.pretty_generate(manifest)}\n")
