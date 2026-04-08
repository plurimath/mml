# frozen_string_literal: true

module Mml
  module V3
    class And < Lutaml::Model::Serializable
      include Base::Content::And
    end
    Configuration.register_model(And, id: :and)

    class Or < Lutaml::Model::Serializable
      include Base::Content::Or
    end
    Configuration.register_model(Or, id: :or)

    class Xor < Lutaml::Model::Serializable
      include Base::Content::Xor
    end
    Configuration.register_model(Xor, id: :xor)

    class Not < Lutaml::Model::Serializable
      include Base::Content::Not
    end
    Configuration.register_model(Not, id: :not)

    class Exists < Lutaml::Model::Serializable
      include Base::Content::Exists
    end
    Configuration.register_model(Exists, id: :exists)

    class Forall < Lutaml::Model::Serializable
      include Base::Content::Forall
    end
    Configuration.register_model(Forall, id: :forall)

    class Implies < Lutaml::Model::Serializable
      include Base::Content::Implies
    end
    Configuration.register_model(Implies, id: :implies)
  end
end
