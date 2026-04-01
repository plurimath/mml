# frozen_string_literal: true

module Mml
  class Error < StandardError; end

  DEFAULT_ADAPTER = RUBY_ENGINE == "opal" ? :oga : :ox
  SUPPORTED_VERSIONS = [3, 4].freeze

  autoload :Namespace, "mml/namespace"
  autoload :CommonElements, "mml/common_elements"
  autoload :Base, "mml/base"
  autoload :V3, "mml/v3"
  autoload :V4, "mml/v4"

  module_function

  def parse(input, namespace_exist: true, version: 3, register: nil)
    unless SUPPORTED_VERSIONS.include?(version)
      raise Error, "Unsupported MathML version: #{version}"
    end

    klass = version == 3 ? Mml::V3 : Mml::V4
    options = { namespace_exist: namespace_exist }
    options[:register] = register if register
    klass.parse(input, **options)
  end
end
