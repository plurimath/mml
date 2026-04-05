# frozen_string_literal: true

module Mml
  module V4
    class Mroot < CommonElements
      include Base::Mroot
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
    Configuration.register_model(Mroot, id: :mroot)
  end
end
