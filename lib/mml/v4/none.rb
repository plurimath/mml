# frozen_string_literal: true

module Mml
  module V4
    # @deprecated V4 spec marks <none> as deprecated.
    #   Use an empty <mrow> instead for MathML Core compatibility.
    class None < Lutaml::Model::Serializable
      include Base::None
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(None, id: :none)
  end
end
