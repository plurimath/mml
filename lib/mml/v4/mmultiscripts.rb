# frozen_string_literal: true

module Mml
  module V4
    class Mmultiscripts < CommonElements
      include Base::Mmultiscripts
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mmultiscripts, id: :mmultiscripts)
  end
end
