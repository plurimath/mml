# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"
RuboCop::RakeTask.new

# Spec preparation tasks
namespace :spec do
  desc "Preprocess MathML fixture files to clean them"
  task :preprocess_fixtures do
    load "spec/tasks/preprocess_fixtures.rb"
  end

  desc "Validate cleaned fixtures against XSD schemas"
  task :validate_cleaned_fixtures do
    load "spec/tasks/validate_cleaned_fixtures.rb"
  end

  desc "Prepare spec fixtures (preprocess + validate)"
  task prepare: %i[preprocess_fixtures validate_cleaned_fixtures]
end

task default: %i[spec rubocop]
