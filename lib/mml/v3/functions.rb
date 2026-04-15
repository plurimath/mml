# frozen_string_literal: true

module Mml
  module V3
    class Compose < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Compose
    end
    Configuration.register_model(Compose, id: :compose)

    class Domain < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Domain
    end
    Configuration.register_model(Domain, id: :domain)

    class Codomain < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Codomain
    end
    Configuration.register_model(Codomain, id: :codomain)

    class Image < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Image
    end
    Configuration.register_model(Image, id: :image)

    class Ident < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Ident
    end
    Configuration.register_model(Ident, id: :ident)

    class Domainofapplication < CommonElements
      include Base::Content::Domainofapplication
    end
    Configuration.register_model(Domainofapplication, id: :domainofapplication)
  end
end
