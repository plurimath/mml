# frozen_string_literal: true

require "lutaml/model"

module Mml
  class Error < StandardError; end

  DEFAULT_ADAPTER = RUBY_ENGINE == "opal" ? :oga : :ox
  SUPPORTED_VERSIONS = [2, 3, 4].freeze
  UNSPECIFIED_CONTEXT = Object.new.freeze

  autoload :Namespace, "mml/namespace"
  autoload :CommonElements, "mml/common_elements"
  autoload :ContextOptions, "mml/context_options"
  autoload :Base, "mml/base"
  autoload :V2, "mml/v2"
  autoload :V3, "mml/v3"
  autoload :V4, "mml/v4"

  module_function

  def parse(
    input,
    namespace_exist: true,
    version: 3,
    context: UNSPECIFIED_CONTEXT,
    register: nil
  )
    parser_for(version).parse(
      input,
      namespace_exist: namespace_exist,
      context: Mml::ContextOptions.normalize_context_option(
        context: context,
        register: register,
        default_context: nil,
        warning_source: "Mml.parse",
      ),
    )
  end

  def parser_for(version)
    return Mml::V2 if version == 2
    return Mml::V3 if version == 3
    return Mml::V4 if version == 4

    raise Error, "Unsupported MathML version: #{version}"
  end
end
