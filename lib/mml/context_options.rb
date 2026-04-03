# frozen_string_literal: true

module Mml
  module ContextOptions
    extend self

    # Normalize the public `context:` / `register:` options into one context id.
    def normalize_context_option(
      context:,
      register:,
      default_context:,
      warning_source:
    )
      raise_if_conflicting_context_options!(context, register)

      if register
        return normalize_register_option(
          register,
          default_context,
          warning_source,
        )
      end

      return default_context unless context_specified?(context)

      normalize_context_reference(context) || default_context
    end

    # Collapse supported references to the symbol id MML uses internally.
    def normalize_context_reference(reference)
      return nil if reference.nil?
      return reference if reference.is_a?(Symbol)
      return reference.to_sym if reference.is_a?(String)
      return reference.id.to_sym if reference.respond_to?(:id)

      raise ArgumentError,
            "Unsupported context/register reference: #{reference.inspect}"
    end

    # Centralize the compatibility warning for parse/configuration callers.
    def warn_register_deprecation(source)
      warn "[Mml] `register` is deprecated in #{source}; use `context` instead."
    end

    private

    def context_specified?(context)
      !context.equal?(Mml::UNSPECIFIED_CONTEXT)
    end

    # MML accepts the old `register:` alias, but never both inputs at once.
    def raise_if_conflicting_context_options!(context, register)
      return unless context_specified?(context) && register

      raise ArgumentError, "Use either `context` or `register`, not both"
    end

    # Keep the compatibility path in one place.
    def normalize_register_option(register, default_context, warning_source)
      warn_register_deprecation(warning_source)
      normalize_context_reference(register) || default_context
    end
  end
end
