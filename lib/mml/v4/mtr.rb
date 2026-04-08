# frozen_string_literal: true

module Mml
  module V4
    class Mtr < Lutaml::Model::Serializable
      include Base::Mtr
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
