# frozen_string_literal: true

module Mml
  module V4
    class Mo < Lutaml::Model::Serializable
      include Base::Mo
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mo, id: :mo)
  end
end
