# frozen_string_literal: true

require_relative "configuration"
require_relative "parser"

module Mml
  class Error < StandardError; end

  def self.config
    Configuration.config
  end

  def self.adapter
    Configuration.adapter ||= :nokogiri
  end

  def self.parse(input)
    Configuration.adapter

    Parser::Math.from_xml(input)
  end
end
