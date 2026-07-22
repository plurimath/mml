# frozen_string_literal: true

module Mml
  module V3
    # Fn represents a function applied to arguments (MathML 2 compatibility).
    class Fn < CommonElements
      include Base::Content::Fn
    end

    class Reln < CommonElements
      include Base::Content::Reln
    end

    class Declare < CommonElements
      include Base::Content::Declare
    end

    class Share < CommonElements
      include Base::Content::Share
    end
  end
end
