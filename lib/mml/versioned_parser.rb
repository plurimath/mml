# frozen_string_literal: true

module Mml
  module VersionedParser
    # Shared parse entrypoint for versioned modules.
    def parse(input, namespace_exist: true,
              context: Mml::UNSPECIFIED_CONTEXT, register: nil)
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

    # Version modules keep their own default context id.
    def parse_context_id(context, register)
      Mml::ContextOptions.normalize_context_option(
        context: context,
        register: register,
        default_context: self::Configuration.default_context_id,
        warning_source: "#{name}.parse",
      )
    end

    # Inject the MathML namespace into the raw XML string before parsing.
    # This avoids a double parse-serialize cycle (previously the code used
    # Moxml to parse → add namespace → serialize → parse again).
    #
    # String-level injection is safe for well-formed MathML: the root element
    # is always <math>. For malformed input, the subsequent from_xml parse will
    # raise a proper error.
    def xml_input(input, namespace_exist)
      return input if namespace_exist

      inject_namespace(input, self::Namespace.uri)
    end

    private

    def inject_namespace(xml_string, namespace_uri)
      # Add xmlns attribute to the <math> root element in the raw XML string.
      # Handles both <math> and <math ...> (with existing attributes).
      xml_string.sub(/<math([\s>])/) do
        "<math xmlns=\"#{namespace_uri}\"#{::Regexp.last_match(1)}"
      end
    end
  end
end
