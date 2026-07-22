# frozen_string_literal: true

module Mml
  module V3
    class Csymbol < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Csymbol
    end
  end
end
