# frozen_string_literal: true

module Mml
  module V4
    class Divergence < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Divergence
    end

    class Grad < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Grad
    end

    class Curl < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Curl
    end

    class Laplacian < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Content::Laplacian
    end
  end
end
