# frozen_string_literal: true

module Mml
  module V4
    class Mn < Lutaml::Model::Serializable
      include Base::Mn
      include Base::V3Common
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
