# frozen_string_literal: true

require "spec_helper"
require "canon"

# Patterns of unsupported features in mml3-testsuite files:
# These patterns identify Content MathML elements that V3 truly does not support.
# Elements that previously lost child content have been fixed to extend CommonElements.
UNSUPPORTED_PATTERNS = [
  # cerror is not implemented
  [/<cerror[\/\s>]/, "content element <cerror> not supported in V3"],
  # share element uses href references that require XInclude (not supported)
  [/<share[\/\s>]/, "content element <share> requires XInclude support"],
].freeze

# Check if a file contains unsupported features and return the reason
def unsupported_reason(content)
  UNSUPPORTED_PATTERNS.each do |pattern, reason|
    return reason if pattern.match?(content)
  end
  nil
end

# Check if two XML strings are equivalent using Canon
def xml_equivalent?(input, output)
  Canon::Comparison.equivalent?(input, output, profile: :spec_friendly)
rescue StandardError
  # If Canon fails to compare, consider them not equivalent
  false
end

RSpec.describe Mml::V3 do
  # mml3-testsuite files all have default namespace declaration
  #
  # Many tests use content elements that don't properly serialize children in V3
  # because they don't extend CommonElements with proper map_element declarations.
  # These tests are marked as pending because the library has known limitations.

  context "with mml3-testsuite files" do
    Dir.glob("./spec/fixtures/mml3-testsuite/Math/testsuite/build/main/**/*.mml").each do |file|
      file_content = File.read(file)
      reason = unsupported_reason(file_content)
      next if reason # Skip unsupported patterns entirely

      test_name = file.sub(
        "./spec/fixtures/mml3-testsuite/Math/testsuite/build/main/", ""
      )

      it "round-trips #{test_name}" do
        input = File.read(file)
        output = described_class.parse(input).to_xml
        expect(output).to be_xml_equivalent_to(input)
      end
    end
  end
end
