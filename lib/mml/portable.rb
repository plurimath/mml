# frozen_string_literal: true

if RUBY_ENGINE != "opal"
  require "digest"
  require "json"
end

module Mml
  # Immutable model declarations for supported portable LML consumers.
  # Reading the bundle does not load or implement a target model runtime.
  module Portable
    class ArtifactError < Mml::Error; end

    DIRECTORY = RUBY_ENGINE == "opal" ? nil : File.expand_path("../../model/portable", __dir__)
    FORMAT = "mml-portable-models/1"

    module_function

    def manifest
      if RUBY_ENGINE == "opal"
        raise ArtifactError, "load model bundle JSON through the target runtime; Ruby filesystem access is unavailable"
      end

      data = JSON.parse(File.read(File.join(DIRECTORY, "manifest.json"), encoding: "UTF-8"))
      unless data.is_a?(Hash) && data["format"] == FORMAT
        raise ArtifactError, "unsupported portable model manifest"
      end

      data
    rescue SystemCallError, JSON::ParserError => e
      raise ArtifactError, "cannot load portable model manifest: #{e.message}"
    end

    # Returns checksum-verified UTF-8 LML bundle bytes for a target generator.
    def bundle(version: 3)
      key = version.to_s
      record = manifest.fetch("versions").fetch(key) do
        raise ArgumentError, "no portable model bundle for MathML #{version} (supported: 3, 4)"
      end
      filename = "mathml-v#{key}.bundle.json"
      raise ArtifactError, "unexpected portable model path" unless record.fetch("path") == filename

      bytes = File.binread(File.join(DIRECTORY, filename))
      unless Digest::SHA256.hexdigest(bytes) == record.fetch("sha256")
        raise ArtifactError, "checksum mismatch: #{filename}"
      end

      bytes.force_encoding(Encoding::UTF_8).freeze
    rescue SystemCallError, KeyError, TypeError => e
      raise ArtifactError, "cannot load portable model bundle: #{e.message}"
    end
  end
end
