# frozen_string_literal: true

module Mml
  class Error < StandardError; end

  module_function

  def config
    Configuration.config
  end

  def parse(input, namespace_exist: true)
    Configuration.adapter = :ox unless Configuration.adapter

    if namespace_exist
      Mml::MathWithNamespace.from_xml(input)
    else
      Mml::MathWithNilNamespace.from_xml(input)
    end
  end
end
