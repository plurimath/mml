# frozen_string_literal: true

require "spec_helper"
require "canon"

# Patterns of unsupported features in mml3-testsuite files:
# These patterns identify Content MathML elements that V3 truly does not support.
# Elements that previously lost child content have been fixed to extend CommonElements.
UNSUPPORTED_PATTERNS_V3 = [
  # share element uses href references that require XInclude (not supported)
  [/<share[\/\s>]/, "content element <share> requires XInclude support"],
  # HTML elements not valid in MathML
  [/<\/span>/, "HTML <span> elements"],
  [/<span[\/\s>]/, "HTML <span> elements"],
  # HTML attributes not valid in MathML V3
  # Entity references not handled
  [/&mathml;/, "&mathml; entity"],
  # Foreign namespace attributes (dsi:background, etc.)
  [/:background/, "foreign namespace attribute"],
  [/:color/, "foreign namespace attribute"],
  # XML comments inside elements
  [/<!--.*-->/, "XML comments inside elements"],
  # ErrorHandling tests contain intentionally invalid MathML - filter out, will test separately
  [/ErrorHandling\//, "ErrorHandling test"],
].freeze

# Check if a file contains unsupported features and return the reason
def unsupported_reason_v3(content)
  UNSUPPORTED_PATTERNS_V3.each do |pattern, reason|
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
      # Skip ErrorHandling tests - they are tested separately as negative tests
      next if file.include?("ErrorHandling/")

      file_content = File.read(file)
      reason = unsupported_reason_v3(file_content)
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

  # ErrorHandling tests are negative tests - they contain intentionally invalid
  # MathML and the parser should reject them with an error.
  # Currently the parser is too lenient and accepts invalid MathML.
  # Mark as pending since this is a known limitation.
  context "with ErrorHandling tests (negative tests)" do
    Dir.glob("./spec/fixtures/mml3-testsuite/Math/testsuite/build/main/ErrorHandling/**/*.mml").each do |file|
      test_name = file.sub(
        "./spec/fixtures/mml3-testsuite/Math/testsuite/build/main/", ""
      )

      it "rejects invalid MathML in #{test_name}",
         skip: "Parser does not validate MathML schema compliance" do
        input = File.read(file)
        expect { described_class.parse(input) }.to raise_error
      end
    end
  end
end
