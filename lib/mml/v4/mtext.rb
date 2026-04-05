# frozen_string_literal: true

module Mml
  module V4
    class Mtext < Lutaml::Model::Serializable
      include Base::Mtext
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mtext, id: :mtext)
  end
end
