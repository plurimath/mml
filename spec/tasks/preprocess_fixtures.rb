#!/usr/bin/env ruby
# frozen_string_literal: true

# Pre-processes MathML fixture files to strip HTML wrapper elements
# and extract the actual MathML content.
#
# Many test files in the mml2-testsuite are wrapped in HTML elements
# like <example>, <eqn>, <name>, etc. This script extracts the MathML
# content and writes clean MathML files.

require "nokogiri"
require "fileutils"

FIXTURES_DIR = File.expand_path("../../spec/fixtures", __dir__)
OUTPUT_DIR = File.expand_path("../../../tmp/cleaned_fixtures", __dir__)

# HTML wrapper patterns to strip
WRAPPER_PATTERNS = [
  # <example> wrapper with nested <eqn><math>...</math></eqn>
  [/<\?xml[^?]*\?><example>.*?<eqn>(<math>.*?<\/math>)<\/eqn>.*?<\/example>/m],
  # <example> with embedded math
  [/<\?xml[^?]*\?><example>.*?(<math>.*?<\/math>).*?<\/example>/m],
  # Simple <math> wrapped in HTML - no xml declaration
  [/<math>.*?<\/math>/m],
].freeze

def extract_mathml(content)
  # First try to find <math>...</math> directly
  math_match = content.match(/<math[^>]*>.*?<\/math>/m)
  return nil unless math_match

  math_xml = math_match[0]

  # If it already has xmlns, return as-is
  return math_xml if math_xml.include?('xmlns=')

  # If it's in an HTML wrapper, extract just the math
  # Check for various wrapper patterns

  # Try <example><eqn><math>...</math></eqn>...</example>
  eqn_match = content.match(/<eqn>(<math[^>]*>.*?<\/math>)<\/eqn>/m)
  return eqn_match[1] if eqn_match

  # Return the raw math without xmlns if standalone
  math_xml
end

def process_file(file_path)
  content = File.read(file_path)
  mathml = extract_mathml(content)
  return nil unless mathml

  # Add MathML namespace if missing
  unless mathml.include?('xmlns=')
    mathml = mathml.sub(/<math\b/, '<math xmlns="http://www.w3.org/1998/Math/MathML"')
  end

  mathml
end

def main
  puts "Pre-processing MathML fixture files..."
  puts "=" * 50

  fixture_dirs = {
    "mml2-testsuite" => "testsuite",
    "mml3-testsuite" => "Math/testsuite/build/main",
  }

  stats = {}

  fixture_dirs.each do |fixture_dir, sub_path|
    src_dir = File.join(FIXTURES_DIR, fixture_dir, sub_path)
    next unless Dir.exist?(src_dir)

    out_dir = File.join(OUTPUT_DIR, fixture_dir, sub_path)
    FileUtils.mkdir_p(out_dir)

    mml_files = Dir.glob(File.join(src_dir, "**/*.mml"))
    stats[fixture_dir] = { processed: 0, cleaned: 0, skipped: 0 }

    mml_files.each do |file|
      rel_path = file.sub("#{src_dir}/", "")
      out_path = File.join(out_dir, rel_path)

      FileUtils.mkdir_p(File.dirname(out_path))

      mathml = process_file(file)

      stats[fixture_dir][:processed] += 1

      if mathml
        File.write(out_path, mathml + "\n")
        stats[fixture_dir][:cleaned] += 1
      else
        # Could not extract MathML - file may be truly unsupported
        stats[fixture_dir][:skipped] += 1
        # Copy original for reference
        File.write(out_path, File.read(file))
      end
    end

    puts "\n#{fixture_dir}:"
    puts "  Processed: #{stats[fixture_dir][:processed]}"
    puts "  Cleaned:   #{stats[fixture_dir][:cleaned]}"
    puts "  Skipped:   #{stats[fixture_dir][:skipped]}"
  end

  puts "\nCleaned fixtures written to: #{OUTPUT_DIR}"
end

main