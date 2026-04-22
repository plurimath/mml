# frozen_string_literal: true

require "spec_helper"
require "canon"
require "yaml"

# Patterns of unsupported features in WPT test files:
UNSUPPORTED_PATTERNS = [
  # HTML elements not valid in MathML
  [/<\/span>/, "HTML <span> elements"],
  [/<span[\/\s>]/, "HTML <span> elements"],
  # dir attribute not in V2 (only in V3+)
  [/dir\s*=/, "dir attribute"],
  # Foreign namespace attributes (we don't support these)
  [/:background/, "foreign namespace attribute"],
  [/:color/, "foreign namespace attribute"],
  [/:fontfamily/, "foreign namespace attribute"],
  [/:mathcolor/, "foreign namespace attribute"],
  [/:mathbackground/, "foreign namespace attribute"],
  # Entity references not handled
  [/&mathml;/, "&mathml; entity"],
  # V2 content elements not implemented
  [/<declare[\/\s>]/, "content element <declare> not implemented in V2"],
  [/<declare>/, "content element <declare> not implemented in V2"],
  # XML comments inside elements
  [/<!--.*-->/, "XML comments inside elements"],
].freeze

# Some tests represent known issues that could be fixed with lutaml-model changes
PENDING_TESTS = [
  # Double-encoded entities (e.g. &amp;#x02009;) are incorrectly resolved by
  # lutaml-model's add_text_with_entities, producing a char ref instead of literal text.
  [/&amp;#x0/, "double-encoded entity reference (lutaml-model bug)"],
  # Common attributes (id, class, style, xref) on leaf elements not supported in V2.
  # Container elements support them via CommonAttributes, but leaf elements (Mi, Mn, Mo, Ms, Mtext)
  # don't include CommonAttributes.
  [/General\/GenAttribs\/class2\.mml/, "V2 leaf elements don't support common attributes"],
  [/General\/GenAttribs\/id1\.mml/, "V2 leaf elements don't support common attributes"],
  [/General\/GenAttribs\/style2\.mml/, "V2 leaf elements don't support common attributes"],
  [/General\/GenAttribs\/xref1\.mml/, "V2 leaf elements don't support common attributes"],
].freeze

# Load files that are invalid according to MathML 2.0 XSD
# Path format matches the cleaned_fixtures directory structure
XSD_INVALID_FILES = begin
  skip_file = "./tmp/invalid_mml2-testsuite_cleaned_by_xsd.yaml"
  if File.exist?(skip_file)
    keys = YAML.load_file(skip_file).keys
    # Convert "testsuite/Content/..." to "Content/..." to match spec path
    keys.to_set { |k| k.sub(/^testsuite\//, "") }
  else
    Set.new
  end
end

# Check if a file contains unsupported features and return the reason
def unsupported_reason(content)
  UNSUPPORTED_PATTERNS.each do |pattern, reason|
    return reason if pattern.match?(content)
  end
  nil
end

# Check if a file should be marked as pending due to known issues
def pending_reason(content, path = "")
  PENDING_TESTS.each do |pattern, reason|
    return reason if pattern.match?(content) || pattern.match?(path)
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

# rubocop:disable RSpec/SpecFilePathFormat
RSpec.describe Mml::V2 do
  # mml2-testsuite .mml files are pre-processed to strip HTML wrappers
  # and extract the MathML content. Cleaned fixtures are in tmp/cleaned_fixtures/.
  # Files that fail XSD validation are skipped via XSD_INVALID_FILES.

  context "with mml2-testsuite files" do
    # Use cleaned fixtures directory
    fixture_dir = "./tmp/cleaned_fixtures/mml2-testsuite/testsuite"

    Dir.glob("#{fixture_dir}/**/*.mml").each do |file|
      file_content = File.read(file)
      reason = unsupported_reason(file_content)
      next if reason # Skip unsupported patterns entirely

      # Skip files that are invalid according to XSD validation
      rel_path = file.sub("#{fixture_dir}/", "")
      next if XSD_INVALID_FILES.include?(rel_path)

      test_name = file.sub("#{fixture_dir}/", "")

      # Handle pending tests - mark as skip with reason
      pending = pending_reason(file_content, test_name)
      if pending
        it "round-trips #{test_name}", skip: pending do
          input = File.read(file)
          output = described_class.parse(input).to_xml(declaration: false)
          expect(output).to be_xml_equivalent_to(input)
        end
      else
        it "round-trips #{test_name}" do
          input = File.read(file)
          output = described_class.parse(input).to_xml(declaration: false)
          expect(output).to be_xml_equivalent_to(input)
        end
      end
    end
  end
end
# rubocop:enable RSpec/SpecFilePathFormat
