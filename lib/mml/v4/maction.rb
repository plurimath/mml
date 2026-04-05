# frozen_string_literal: true

module Mml
  module V4
    class Maction < Lutaml::Model::Serializable
      include Base::Maction
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Maction, id: :maction)
  end
end
