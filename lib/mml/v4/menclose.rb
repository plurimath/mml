# frozen_string_literal: true

module Mml
  module V4
    class Menclose < CommonElements
      include Base::Menclose
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Menclose, id: :menclose)
  end
end
