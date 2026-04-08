# frozen_string_literal: true

module Mml
  module V4
    class Mprescripts < Lutaml::Model::Serializable
      include Base::Mprescripts
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
