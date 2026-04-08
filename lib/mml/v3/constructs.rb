# frozen_string_literal: true

module Mml
  module V3
    class Bvar < CommonElements
      include Base::Content::Bvar
    end
    Configuration.register_model(Bvar, id: :bvar)

    class Condition < CommonElements
      include Base::Content::Condition
    end
    Configuration.register_model(Condition, id: :condition)

    class Interval < CommonElements
      include Base::Content::Interval
    end
    Configuration.register_model(Interval, id: :interval)

    class Lambda < CommonElements
      include Base::Content::Lambda
    end
    Configuration.register_model(Lambda, id: :lambda)

    class Inverse < CommonElements
      include Base::Content::Inverse
    end
    Configuration.register_model(Inverse, id: :inverse)

    class Degree < CommonElements
      include Base::Content::Degree
    end
    Configuration.register_model(Degree, id: :degree)

    class Piecewise < CommonElements
      include Base::Content::Piecewise
    end
    Configuration.register_model(Piecewise, id: :piecewise)

    class Piece < CommonElements
      include Base::Content::Piece
    end
    Configuration.register_model(Piece, id: :piece)

    class Otherwise < CommonElements
      include Base::Content::Otherwise
    end
    Configuration.register_model(Otherwise, id: :otherwise)

    class Sep < CommonElements
      include Base::Content::Sep
    end
    Configuration.register_model(Sep, id: :sep)
  end
end
