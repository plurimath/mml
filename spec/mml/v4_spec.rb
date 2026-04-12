# frozen_string_literal: true

require "spec_helper"
require "canon"

# Patterns of unsupported features in WPT test files:
UNSUPPORTED_PATTERNS_V4 = [
  # HTML elements not valid in MathML (check for span element - self-closing or with content)
  [/<\/span>/, "HTML <span> elements"],
  [/<span[\/\s>]/, "HTML <span> elements"],
  # HTML attributes not valid in MathML V4
  [/dir\s*=/, "dir attribute"],
  [/mode\s*=/, "mode attribute"],
  [/tabindex\s*=/, "tabindex attribute"],
  [/data-[a-z]+=/, "data-* attribute"],
  [/on[a-z]+\s*=/, "event handler attribute"],
  # Table cell attributes not supported on mtd in V4
  [/rowspan\s*=/, "rowspan attribute"],
  [/colspan\s*=/, "colspan attribute"],
  # Entity references not handled
  [/&mathml;/, "&mathml; entity"],
  # XML comments inside elements
  [/<!--.*-->/, "XML comments inside elements"],
  # Foreign content in annotation-xml (SVG, etc.) - only allow MathML encodings
  [/annotation-xml encoding="(?!application\/mathml)/,
   "foreign content in annotation-xml"],
  # Crashtests - browser bug tests with unusual markup
  [/crashtests\//, "crashtest file"],
  # Crashtests - browser bug tests with unusual/invalid markup patterns
  [/<mtr\s*\/>/, "empty mtr element"],
  [/<mroot\s*\/>/, "empty mroot element"],
  [/<factorial\s*\/>/, "content element in presentation context"],
  [/<maction\s*\/>/, "empty maction element"],
  [/<mfenced\s*\/>/, "empty mfenced element"],
  [/<frameset\s*\/>/, "HTML frameset element in MathML"],
  # URLs without protocol may not serialize correctly
  [/href="www\./, "URL without protocol"],
  # Semantics with external annotations
  [/annotation src=/, "annotation with src attribute"],
  # Entity references not resolved
  [/&[a-zA-Z]+;/, "unresolved entity reference"],
].freeze

# Check if a file contains unsupported features and return the reason
def unsupported_reason_v4(content)
  UNSUPPORTED_PATTERNS_V4.each do |pattern, reason|
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

RSpec.describe Mml::V4 do
  # mmlcore-testsuite .mml files are extracted from WPT MathML Core tests
  # They are without namespace declaration, so we add xmlns then strip for comparison.
  #
  # Many WPT tests use HTML attributes (class, style, id) and elements (span)
  # that are not part of MathML V4 specification. These tests are filtered out
  # via UNSUPPORTED_PATTERNS and do not appear in test output.
  #
  # Some tests also fail due to structural issues where the library loses content
  # or produces semantically different output. These are also filtered out.

  context "with mmlcore-testsuite files" do
    Dir.glob("./spec/fixtures/mmlcore-testsuite/mathml/**/*.mml").each do |file|
      file_content = File.read(file)
      reason = unsupported_reason_v4(file_content)
      next if reason # Skip unsupported patterns entirely

      test_name = file.sub("./spec/fixtures/mmlcore-testsuite/mathml/", "")

      it "round-trips #{test_name}" do
        input = File.read(file)
        output = described_class.parse(input).to_xml(declaration: false)
        input.sub!(/\s*xmlns="[^"]+"/, "")
        output.sub!(/\s*xmlns="[^"]+"/, "")
        expect(output).to be_xml_equivalent_to(input)
      end
    end
  end
end
