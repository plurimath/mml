# frozen_string_literal: true

module Mml
  module V4
    # Fn represents a function applied to arguments (MathML 2 compatibility).
    class Fn < CommonElements
      include Base::Content::Fn
    end

    # Reln represents a relation (MathML 2 compatibility).
    class Reln < CommonElements
      include Base::Content::Reln
    end

    # Declare declares a mathematical object (MathML 2 compatibility).
    class Declare < CommonElements
      include Base::Content::Declare
    end

    # Share enables reuse of subexpressions (MathML 2 compatibility).
    class Share < CommonElements
      include Base::Content::Share
    end
  end
end
