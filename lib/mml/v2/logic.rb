# frozen_string_literal: true

module Mml
  module V2
    class And < Lutaml::Model::Serializable
      include Base::Content::And
    end

    class Or < Lutaml::Model::Serializable
      include Base::Content::Or
    end

    class Xor < Lutaml::Model::Serializable
      include Base::Content::Xor
    end

    class Not < Lutaml::Model::Serializable
      include Base::Content::Not
    end

    class Exists < Lutaml::Model::Serializable
      include Base::Content::Exists
    end

    class Forall < Lutaml::Model::Serializable
      include Base::Content::Forall
    end

    class Implies < Lutaml::Model::Serializable
      include Base::Content::Implies
    end
  end
end
