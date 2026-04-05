# frozen_string_literal: true

module Mml
  module V4
    class Maligngroup < Lutaml::Model::Serializable
      include Base::Maligngroup
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Maligngroup, id: :maligngroup)
  end
end
