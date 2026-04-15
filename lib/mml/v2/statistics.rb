# frozen_string_literal: true

module Mml
  module V2
    class Mean < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v2
      end

      include Base::Content::Mean
    end

    class Sdev < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v2
      end

      include Base::Content::Sdev
    end

    class Variance < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v2
      end

      include Base::Content::Variance
    end

    class Median < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v2
      end

      include Base::Content::Median
    end

    class Mode < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v2
      end

      include Base::Content::Mode
    end

    class Moment < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v2
      end

      include Base::Content::Moment
    end

    class Momentabout < CommonElements
      include Base::Content::Momentabout
    end
  end
end
