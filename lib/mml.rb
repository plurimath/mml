# frozen_string_literal: true

module Mml
  class Error < StandardError; end

  autoload :V3, "mml/v3"
  autoload :V4, "mml/v4"

  module_function

  def parse(input, namespace_exist: true, version: 3)
    case version
    when 3 then Mml::V3.parse(input, namespace_exist: namespace_exist)
    when 4 then Mml::V4.parse(input, namespace_exist: namespace_exist)
    else raise Error, "Unsupported MathML version: #{version}"
    end
  end
end
