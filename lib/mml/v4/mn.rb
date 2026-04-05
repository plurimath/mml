# frozen_string_literal: true

module Mml
  module V4
    class Mn < Lutaml::Model::Serializable
      include Base::Mn
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mn, id: :mn)
  end
end
