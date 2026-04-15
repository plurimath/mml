# frozen_string_literal: true

module Mml
  module V3
    class Mean < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Mean
    end
    Configuration.register_model(Mean, id: :mean)

    class Sdev < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Sdev
    end
    Configuration.register_model(Sdev, id: :sdev)

    class Variance < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Variance
    end
    Configuration.register_model(Variance, id: :variance)

    class Median < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Median
    end
    Configuration.register_model(Median, id: :median)

    class Mode < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Mode
    end
    Configuration.register_model(Mode, id: :mode)

    class Moment < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Moment
    end
    Configuration.register_model(Moment, id: :moment)

    class Momentabout < CommonElements
      include Base::Content::Momentabout
    end
    Configuration.register_model(Momentabout, id: :momentabout)
  end
end
