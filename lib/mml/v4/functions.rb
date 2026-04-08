# frozen_string_literal: true

module Mml
  module V4
    class Compose < Lutaml::Model::Serializable
      include Base::Content::Compose
    end

    class Domain < Lutaml::Model::Serializable
      include Base::Content::Domain
    end

    class Codomain < Lutaml::Model::Serializable
      include Base::Content::Codomain
    end

    class Image < Lutaml::Model::Serializable
      include Base::Content::Image
    end

    class Ident < Lutaml::Model::Serializable
      include Base::Content::Ident
    end

    class Domainofapplication < CommonElements
      include Base::Content::Domainofapplication
    end
    Configuration.register_model(Domainofapplication, id: :domainofapplication)
  end
end
