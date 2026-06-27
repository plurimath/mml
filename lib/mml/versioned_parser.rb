# frozen_string_literal: true

module Mml
  module VersionedParser
    # Shared parse entrypoint for versioned modules.
    def parse(input, namespace_exist: true,
              context: Mml::UNSPECIFIED_CONTEXT, register: nil)
      ensure_registered!
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

    # Populate this version's registry on first use. Memoized so subsequent
    # parses skip the cost. Version modules may override `register_models!`
    # to provide a centralized registration block; the default triggers
    # autoload resolution which fires per-file `register_model` calls.
    def ensure_registered!
      return if @models_registered

      register_models!
      @models_registered = true
    end

    # Default registration: force every autoloaded entry point to load so
    # per-file `Configuration.register_model` side-effects fire. Versions
    # with a centralized registration block override this method.
    def register_models!
      eager_load_entry_points!
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

    # Force resolution of every autoloaded entry point on this version module.
    # Needed because element files self-register with Configuration at load
    # time, and autoload declarations alone don't trigger that side-effect.
    # Under Opal this is a no-op: the boot file eager-requires everything.
    def eager_load_entry_points!
      constants.each { |name| const_get(name) }
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
