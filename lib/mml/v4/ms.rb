# frozen_string_literal: true

module Mml
  module V4
    class Ms < CommonElements
      include Base::Ms
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Ms, id: :ms)
  end
end
