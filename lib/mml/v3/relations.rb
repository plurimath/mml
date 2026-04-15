# frozen_string_literal: true

module Mml
  module V3
    class Eq < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Eq
    end
    Configuration.register_model(Eq, id: :eq)

    class Neq < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Neq
    end
    Configuration.register_model(Neq, id: :neq)

    class Leq < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Leq
    end
    Configuration.register_model(Leq, id: :leq)

    class Lt < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Lt
    end
    Configuration.register_model(Lt, id: :lt)

    class Geq < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Geq
    end
    Configuration.register_model(Geq, id: :geq)

    class Gt < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Gt
    end
    Configuration.register_model(Gt, id: :gt)

    class Equivalent < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Equivalent
    end
    Configuration.register_model(Equivalent, id: :equivalent)

    class Approx < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Approx
    end
    Configuration.register_model(Approx, id: :approx)

    class Factorof < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Factorof
    end
    Configuration.register_model(Factorof, id: :factorof)
  end
end
