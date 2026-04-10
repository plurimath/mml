# frozen_string_literal: true

module Mml
  module V3
    class Cerror < CommonElements
      include Base::Content::Cerror
    end
    Configuration.register_model(Cerror, id: :cerror)
  end
end
