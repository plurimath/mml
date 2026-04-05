# frozen_string_literal: true

module Mml
  module V4
    class Malignmark < Lutaml::Model::Serializable
      include Base::Malignmark
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Malignmark, id: :malignmark)
  end
end
