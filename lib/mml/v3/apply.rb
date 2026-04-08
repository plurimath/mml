# frozen_string_literal: true

module Mml
  module V3
    class Apply < CommonElements
      include Base::Content::Apply
    end
    Configuration.register_model(Apply, id: :apply)
  end
end
