# frozen_string_literal: true

require "mml/v3"

module Mml
  class Error < StandardError; end

  # Delegate undefined constants to Mml::V3 for backward compatibility.
  # Lazily loads Mml::V4 when referenced.
  def self.const_missing(name)
    if name == :V4
      require "mml/v4"
      Mml::V4
    elsif Mml::V3.const_defined?(name)
      Mml::V3.const_get(name)
    else
      raise NameError, "uninitialized constant Mml::#{name}"
    end
  end

  module_function

  def parse(input, namespace_exist: true, version: 3)
    case version
    when 3 then Mml::V3.parse(input, namespace_exist: namespace_exist)
    when 4
      require "mml/v4"
      Mml::V4.parse(input, namespace_exist: namespace_exist)
    else raise Error, "Unsupported MathML version: #{version}"
    end
  end

  # Backward compatibility: Mml aliases Mml::V3
  Configuration = Mml::V3::Configuration

  # Explicitly define Math to avoid collision with Ruby built-in Math module
  Math = Mml::V3::Math
end
