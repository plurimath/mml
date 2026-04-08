# frozen_string_literal: true

module Mml
  module V3
    # Fn represents a function applied to arguments (MathML 2 compatibility).
    class Fn < CommonElements
      include Base::Content::Fn
    end
    Configuration.register_model(Fn, id: :fn)

    # Reln represents a relation (MathML 2 compatibility).
    class Reln < CommonElements
      include Base::Content::Reln
    end
    Configuration.register_model(Reln, id: :reln)

    # Declare declares a mathematical object (MathML 2 compatibility).
    class Declare < CommonElements
      include Base::Content::Declare
    end
    Configuration.register_model(Declare, id: :declare)

    # Share enables reuse of subexpressions (MathML 2 compatibility).
    class Share < CommonElements
      include Base::Content::Share
    end
    Configuration.register_model(Share, id: :share)
  end
end
