# frozen_string_literal: true

module Mml
  module V4
    class Mi < Lutaml::Model::Serializable
      include Base::Mi
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mi, id: :mi)
  end
end
