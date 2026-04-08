# frozen_string_literal: true

module Mml
  module V2
    class Set < Lutaml::Model::Serializable
      include Base::Content::Set
    end

    class Mlist < Lutaml::Model::Serializable
      include Base::Content::List
    end

    class Union < Lutaml::Model::Serializable
      include Base::Content::Union
    end

    class Intersect < Lutaml::Model::Serializable
      include Base::Content::Intersect
    end

    class In < Lutaml::Model::Serializable
      include Base::Content::In
    end

    class Notin < Lutaml::Model::Serializable
      include Base::Content::Notin
    end

    class Subset < Lutaml::Model::Serializable
      include Base::Content::Subset
    end

    class Prsubset < Lutaml::Model::Serializable
      include Base::Content::Prsubset
    end

    class Notsubset < Lutaml::Model::Serializable
      include Base::Content::Notsubset
    end

    class Notprsubset < Lutaml::Model::Serializable
      include Base::Content::Notprsubset
    end

    class Setdiff < Lutaml::Model::Serializable
      include Base::Content::Setdiff
    end

    class Card < Lutaml::Model::Serializable
      include Base::Content::Card
    end

    class Cartesianproduct < Lutaml::Model::Serializable
      include Base::Content::Cartesianproduct
    end
  end
end
