# frozen_string_literal: true

module Mml
  module V3
    class Bind < CommonElements
      include Base::Content::Bind
    end
    Configuration.register_model(Bind, id: :bind)
  end
end
