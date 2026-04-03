# frozen_string_literal: true

module Mml
  module VersionedParser
    # Shared parse entrypoint for versioned modules.
    def parse(input, namespace_exist: true,
              context: Mml::UNSPECIFIED_CONTEXT, register: nil)
      self::Configuration.adapter ||= Mml::DEFAULT_ADAPTER
      context_id = parse_context_id(context, register)
      root_class = Lutaml::Model::GlobalContext.resolve_type(
        :math,
        context_id,
      )

      root_class.from_xml(
        xml_input(input, namespace_exist),
        register: context_id,
      )
    end

    # Namespace-less MathML is normalized before handing it to lutaml-model.
    def parse_with_no_namespace(input)
      adapter = self::Configuration.adapter || Mml::DEFAULT_ADAPTER
      Moxml.new(adapter).parse(input).tap do |doc|
        doc.root.add_namespace(nil, self::Namespace.uri)
      end.to_xml
    end

    # Version modules keep their own default context id.
    def parse_context_id(context, register)
      Mml::ContextOptions.normalize_context_option(
        context: context,
        register: register,
        default_context: self::Configuration.context_id,
        warning_source: "#{name}.parse",
      )
    end

    # Keep the main parse flow readable by separating namespace normalization.
    def xml_input(input, namespace_exist)
      return input if namespace_exist

      parse_with_no_namespace(input)
    end
  end
end
