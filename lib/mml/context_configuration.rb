# frozen_string_literal: true

module Mml
  module ContextConfiguration
    def context_id
      self::CONTEXT_ID
    end

    # Expose the version's built-in context without mutating global state.
    def context
      Lutaml::Model::GlobalContext.context(context_id)
    end

    # Create the built-in context or a derived context with substitutions.
    def create_context(
      id:,
      registry: nil,
      fallback_to: [context_id],
      substitutions: []
    )
      normalized_id = Mml::ContextOptions.normalize_context_reference(id)

      return populate_context! if normalized_id == context_id

      Lutaml::Model::GlobalContext.unregister_context(normalized_id) if Lutaml::Model::GlobalContext.context(normalized_id)
      create_type_context(
        id: normalized_id,
        registry: registry || Lutaml::Model::TypeRegistry.new,
        fallback_to: normalize_fallbacks(fallback_to),
        substitutions: substitutions,
      )
    end

    # Explicitly rebuild the built-in version context.
    def populate_context!
      Lutaml::Model::GlobalContext.unregister_context(context_id) if context
      register_models_in(base_type_context)
    end

    # Register a model now and remember it for later rebuilds.
    def register_model(klass, id:)
      normalized_id = id.to_sym
      registered_models[normalized_id] = klass
      (context || populate_base_context).registry.register(normalized_id, klass)
      clear_cache(klass)
      klass
    end

    def register
      Mml::ContextOptions.warn_register_deprecation("#{name}.register")
      @deprecated_register_context_id || context_id
    end

    def register=(value)
      Mml::ContextOptions.warn_register_deprecation("#{name}.register=")
      @deprecated_register_context_id =
        Mml::ContextOptions.normalize_context_reference(value)
      create_context(id: @deprecated_register_context_id) unless Lutaml::Model::GlobalContext.context(@deprecated_register_context_id)
    end

    def adapter
      Lutaml::Model::Config.xml_adapter_type
    end

    def adapter=(adapter)
      Lutaml::Model::Config.xml_adapter_type = adapter
    end

    private

    def populate_base_context
      base_type_context
    end

    def create_type_context(id:, registry:, fallback_to:, substitutions: [])
      Lutaml::Model::GlobalContext.create_context(
        id: id,
        registry: registry,
        fallback_to: fallback_to,
        substitutions: substitutions,
      ).tap do
        Lutaml::Model::GlobalContext.clear_caches
      end
    end

    def base_type_context
      create_type_context(
        id: context_id,
        registry: Lutaml::Model::TypeRegistry.new,
        fallback_to: [:default],
      )
    end

    def register_models_in(type_context)
      registered_models.each do |model_id, klass|
        type_context.registry.register(model_id, klass)
        clear_cache(klass)
      end

      Lutaml::Model::GlobalContext.clear_caches
      type_context
    end

    def normalize_fallbacks(fallback_to)
      Array(fallback_to).map do |fallback|
        Mml::ContextOptions.normalize_context_reference(fallback)
      end
    end

    def registered_models
      @registered_models ||= {}
    end

    def clear_cache(klass)
      klass.clear_cache(context_id) if klass.respond_to?(:clear_cache)
    end
  end
end
