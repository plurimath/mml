# frozen_string_literal: true

module Mml
  module V4
    # @deprecated V4 spec marks <none> as deprecated.
    #   Use an empty <mrow> instead for MathML Core compatibility.
    class None < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::None
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
