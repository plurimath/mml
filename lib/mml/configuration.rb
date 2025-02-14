# frozen_string_literal: true

module Mml
  module Configuration
    SUPPORTED_TAGS = %i[
      mmultiscripts
      maligngroup
      malignmark
      munderover
      semantics
      mscarries
      mfraction
      mphantom
      menclose
      mlongdiv
      mpadded
      msubsup
      mscarry
      mfenced
      msgroup
      mglyph
      mstack
      munder
      mtable
      mstyle
      mspace
      msline
      merror
      msrow
      mfrac
      mover
      mroot
      mtext
      msqrt
      none
      mrow
      msub
      msup
      mi
      mo
      mn
      ms
    ].freeze

    COMMON_ATTRIBUTES_CLASSES = %w[
      MathWithNilNamespace
      MathWithNamespace
      Mmultiscripts
      Munderover
      Semantics
      Mscarries
      Mfraction
      Mlongdiv
      Mphantom
      Menclose
      Mfenced
      Mpadded
      Msubsup
      Msgroup
      Mscarry
      Munder
      Mstyle
      Mstack
      Merror
      Mover
      Mfrac
      Msrow
      Mroot
      Msqrt
      Mrow
      Msub
      Msup
      Mtd
      Ms
    ].freeze

    module_function

    def config
      @config ||= {}
    end

    def config=(config)
      self.config.merge!(config)
    end

    def custom_models=(models_hash)
      # { Mi => CustomMiClass, Mo => CustomMoClass }
      models_hash.each { |klass, model| klass.model(model) }
    end

    def adapter
      Lutaml::Model::Config.xml_adapter
    end

    def adapter=(adapter)
      Lutaml::Model::Config.xml_adapter_type = adapter.downcase
    end

    def class_for(class_name)
      config[class_name]
    end
  end
end
