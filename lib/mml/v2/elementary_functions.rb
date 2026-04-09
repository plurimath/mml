# frozen_string_literal: true

module Mml
  module V2
    class Exp < CommonElements
      include Base::Content::Exp
    end

    class Ln < CommonElements
      include Base::Content::Ln
    end

    class Log < CommonElements
      include Base::Content::Log
    end

    class Logbase < CommonElements
      include Base::Content::Logbase
    end

    # Trigonometric
    class Sin < CommonElements
      include Base::Content::Sin
    end

    class Cos < CommonElements
      include Base::Content::Cos
    end

    class Tan < CommonElements
      include Base::Content::Tan
    end

    class Sec < CommonElements
      include Base::Content::Sec
    end

    class Csc < CommonElements
      include Base::Content::Csc
    end

    class Cot < CommonElements
      include Base::Content::Cot
    end

    # Inverse trigonometric
    class Arcsin < CommonElements
      include Base::Content::Arcsin
    end

    class Arccos < CommonElements
      include Base::Content::Arccos
    end

    class Arctan < CommonElements
      include Base::Content::Arctan
    end

    class Arccot < CommonElements
      include Base::Content::Arccot
    end

    class Arccsc < CommonElements
      include Base::Content::Arccsc
    end

    class Arcsec < CommonElements
      include Base::Content::Arcsec
    end

    # Hyperbolic
    class Sinh < CommonElements
      include Base::Content::Sinh
    end

    class Cosh < CommonElements
      include Base::Content::Cosh
    end

    class Tanh < CommonElements
      include Base::Content::Tanh
    end

    class Sech < CommonElements
      include Base::Content::Sech
    end

    class Csch < CommonElements
      include Base::Content::Csch
    end

    class Coth < CommonElements
      include Base::Content::Coth
    end

    # Inverse hyperbolic
    class Arcsinh < CommonElements
      include Base::Content::Arcsinh
    end

    class Arccosh < CommonElements
      include Base::Content::Arccosh
    end

    class Arctanh < CommonElements
      include Base::Content::Arctanh
    end

    class Arccoth < CommonElements
      include Base::Content::Arccoth
    end

    class Arccsch < CommonElements
      include Base::Content::Arccsch
    end

    class Arcsech < CommonElements
      include Base::Content::Arcsech
    end
  end
end
