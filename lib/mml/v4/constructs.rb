# frozen_string_literal: true

module Mml
  module V4
    class Bvar < CommonElements
      include Base::Content::Bvar
    end

    class Condition < CommonElements
      include Base::Content::Condition
    end

    class Interval < CommonElements
      include Base::Content::Interval
    end

    class Lambda < CommonElements
      include Base::Content::Lambda
    end

    class Inverse < CommonElements
      include Base::Content::Inverse
    end

    class Degree < CommonElements
      include Base::Content::Degree
    end

    class Piecewise < CommonElements
      include Base::Content::Piecewise
    end

    class Piece < CommonElements
      include Base::Content::Piece
    end

    class Otherwise < CommonElements
      include Base::Content::Otherwise
    end

    class Sep < CommonElements
      include Base::Content::Sep
    end

    class Bind < CommonElements
      include Base::Content::Bind
    end
  end
end
