# frozen_string_literal: true

module Mml
  module V3
    class Set < CommonElements
      include Base::Content::Set
    end
    Configuration.register_model(Set, id: :set)

    class Mlist < CommonElements
      include Base::Content::List
    end
    Configuration.register_model(Mlist, id: :list)

    class Union < Lutaml::Model::Serializable
      include Base::Content::Union
    end
    Configuration.register_model(Union, id: :union)

    class Intersect < Lutaml::Model::Serializable
      include Base::Content::Intersect
    end
    Configuration.register_model(Intersect, id: :intersect)

    class In < Lutaml::Model::Serializable
      include Base::Content::In
    end
    Configuration.register_model(In, id: :in)

    class Notin < Lutaml::Model::Serializable
      include Base::Content::Notin
    end
    Configuration.register_model(Notin, id: :notin)

    class Subset < Lutaml::Model::Serializable
      include Base::Content::Subset
    end
    Configuration.register_model(Subset, id: :subset)

    class Prsubset < Lutaml::Model::Serializable
      include Base::Content::Prsubset
    end
    Configuration.register_model(Prsubset, id: :prsubset)

    class Notsubset < Lutaml::Model::Serializable
      include Base::Content::Notsubset
    end
    Configuration.register_model(Notsubset, id: :notsubset)

    class Notprsubset < Lutaml::Model::Serializable
      include Base::Content::Notprsubset
    end
    Configuration.register_model(Notprsubset, id: :notprsubset)

    class Setdiff < Lutaml::Model::Serializable
      include Base::Content::Setdiff
    end
    Configuration.register_model(Setdiff, id: :setdiff)

    class Card < Lutaml::Model::Serializable
      include Base::Content::Card
    end
    Configuration.register_model(Card, id: :card)

    class Cartesianproduct < Lutaml::Model::Serializable
      include Base::Content::Cartesianproduct
    end
    Configuration.register_model(Cartesianproduct, id: :cartesianproduct)
  end
end
