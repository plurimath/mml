# frozen_string_literal: true

require "mml"
require "mml/v4"
require "rspec/matchers"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require "lutaml/model"
Lutaml::Model::Config.configure do |config|
  config.xml_adapter_type = :nokogiri
end

require "canon"
# Configure Canon for XML comparison to ignore comments and use spec-friendly profile
# This makes comparisons more tolerant of formatting differences
Canon::Config.configure do |config|
  config.xml.match.profile = :spec_friendly
  config.xml.diff.algorithm = :semantic
  config.xml.diff.max_node_count = 50_000
end
