# frozen_string_literal: true

require_relative "configuration"
require_relative "math"
require_relative "mi"

module Mml
  class Error < StandardError; end

  def config
    Configuration.config
  end

  def adapter
    Configuration.adapter ||= :nokogiri
  end

  def parse(input)
    Configuration.adapter

    Mml::Math.from_xml(input)
  end

  module_function :config, :adapter, :parse
end
