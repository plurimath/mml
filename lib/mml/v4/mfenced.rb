# frozen_string_literal: true

module Mml
  module V4
    class Mfenced < CommonElements
      include Base::Mfenced
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mfenced, id: :mfenced)
  end
end
