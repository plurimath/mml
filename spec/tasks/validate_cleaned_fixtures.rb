#!/usr/bin/env ruby
# frozen_string_literal: true

# Validates pre-processed MathML fixture files against XSD schemas.
# Uses the cleaned fixtures from preprocess_fixtures.rb output.

require "nokogiri"
require "yaml"
require "fileutils"

class MathmlValidator
  SCHEMA_DIR = File.expand_path("../../schemas", __dir__)
  FIXTURES_DIR = File.expand_path("../../../tmp/cleaned_fixtures", __dir__)
  OUTPUT_DIR = File.expand_path("../../../tmp", __dir__)

  SCHEMA_MAP = {
    "mml2-testsuite" => "mathml2/mathml2.xsd",
    "mml3-testsuite" => "mathml3/mathml3.xsd",
  }.freeze

  attr_reader :schema_name, :schema_path, :fixture_dir, :invalid_files

  def initialize(fixture_dir_name)
    @fixture_dir_name = fixture_dir_name
    schema_rel_path = SCHEMA_MAP[fixture_dir_name]
    @schema_path = schema_rel_path ? File.join(SCHEMA_DIR, schema_rel_path) : nil
    @fixture_dir = File.join(FIXTURES_DIR, fixture_dir_name)
    @invalid_files = {}
  end

  def schema_available?
    @schema_path && File.exist?(@schema_path)
  end

  def validate_file(schema, file_path)
    xml_content = File.read(file_path)
    doc = Nokogiri::XML(xml_content)

    errors = []
    schema.validate(doc).each do |error|
      errors << {
        message: error.message,
        line: error.line,
        column: error.column
      }
    end

    errors
  end

  def collect_mml_files
    # Look for .mml files in subdirectories
    pattern = File.join(@fixture_dir, "**/*.mml")
    Dir.glob(pattern)
  end

  def run
    unless schema_available?
      puts "  [SKIP] No schema available for #{@fixture_dir_name}"
      return
    end

    puts "Loading #{@schema_path}..."
    Dir.chdir(File.dirname(@schema_path)) do
      schema_doc = Nokogiri::XML::Schema(File.read(File.basename(@schema_path)))

      mml_files = collect_mml_files
      puts "  Found #{mml_files.length} .mml files"

      valid_count = 0
      invalid_count = 0

      mml_files.each do |file|
        errors = validate_file(schema_doc, file)
        rel_path = file.sub("#{@fixture_dir}/", "")

        if errors.any?
          @invalid_files[rel_path] = errors.map { |e| "#{e[:message]} (line #{e[:line]})" }
          invalid_count += 1
        else
          valid_count += 1
        end
      end

      puts "  Valid: #{valid_count}, Invalid: #{invalid_count}"
    end
  end

  def save_results
    return if @invalid_files.empty?

    output_path = File.join(OUTPUT_DIR, "invalid_#{@fixture_dir_name}_cleaned_by_xsd.yaml")
    FileUtils.mkdir_p(OUTPUT_DIR)
    File.write(output_path, YAML.dump(@invalid_files))
    puts "  Invalid files written to: #{output_path}"
  end
end

def main
  puts "MathML XSD Validation (Cleaned Fixtures)"
  puts "=" * 50

  fixture_dirs = %w[mml2-testsuite mml3-testsuite]

  all_invalid = {}

  fixture_dirs.each do |dir|
    puts "\nValidating #{dir}..."
    validator = MathmlValidator.new(dir)
    validator.run
    validator.save_results
    all_invalid.merge!(validator.invalid_files) if validator.invalid_files.any?
  end

  if all_invalid.any?
    puts "\n" + "=" * 50
    puts "Summary by error type:"

    by_error = Hash.new { |h, k| h[k] = [] }
    all_invalid.each do |file, errors|
      errors.each { |e| by_error[e] << file }
    end

    by_error.each do |error, files|
      puts "\n  #{error}:"
      files.first(5).each { |f| puts "    - #{f}" }
      puts "    ... and #{files.length - 5} more" if files.length > 5
    end
  end

  puts "\nValidation complete."
end

main