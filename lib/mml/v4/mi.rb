# frozen_string_literal: true

module Mml
  module V4
    class Mi < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end

      include Base::Mi
      include Base::V3Common
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
