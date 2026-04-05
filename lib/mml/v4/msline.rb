# frozen_string_literal: true

module Mml
  module V4
    class Msline < Lutaml::Model::Serializable
      include Base::Msline
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Msline, id: :msline)
  end
end
