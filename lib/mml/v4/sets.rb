# frozen_string_literal: true

module Mml
  module V4
    class Set < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Set
    end

    class List < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::List
    end

    class Union < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Union
    end

    class Intersect < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Intersect
    end

    class In < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::In
    end

    class Notin < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Notin
    end

    class Notsubset < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Notsubset
    end

    class Notprsubset < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Notprsubset
    end

    class Subset < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Subset
    end

    class Prsubset < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Prsubset
    end

    class Setdiff < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Setdiff
    end

    class Card < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Card
    end

    class Cartesianproduct < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Cartesianproduct
    end
  end
end
