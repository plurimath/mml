# frozen_string_literal: true

module Mml
  module V4
    class Mlongdiv < CommonElements
      include Base::Mlongdiv
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mlongdiv, id: :mlongdiv)
  end
end
