# frozen_string_literal: true

module Mml
  module V2
    class Mo < CommonElements
      include Base::Mo
      include Base::V3Only::OperatorAttributes
    end
  end
end
