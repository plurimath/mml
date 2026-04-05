# frozen_string_literal: true

module Mml
  module V4
    class Mspace < Lutaml::Model::Serializable
      include Base::Mspace
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mspace, id: :mspace)
  end
end
