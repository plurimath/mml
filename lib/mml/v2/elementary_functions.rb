# frozen_string_literal: true

module Mml
  module V2
    class Exp < Lutaml::Model::Serializable
      include Base::Content::Exp
    end

    class Ln < Lutaml::Model::Serializable
      include Base::Content::Ln
    end

    class Log < Lutaml::Model::Serializable
      include Base::Content::Log
    end

    class Logbase < Lutaml::Model::Serializable
      include Base::Content::Logbase
    end

    # Trigonometric
    class Sin < Lutaml::Model::Serializable
      include Base::Content::Sin
    end

    class Cos < Lutaml::Model::Serializable
      include Base::Content::Cos
    end

    class Tan < Lutaml::Model::Serializable
      include Base::Content::Tan
    end

    class Sec < Lutaml::Model::Serializable
      include Base::Content::Sec
    end

    class Csc < Lutaml::Model::Serializable
      include Base::Content::Csc
    end

    class Cot < Lutaml::Model::Serializable
      include Base::Content::Cot
    end

    # Inverse trigonometric
    class Arcsin < Lutaml::Model::Serializable
      include Base::Content::Arcsin
    end

    class Arccos < Lutaml::Model::Serializable
      include Base::Content::Arccos
    end

    class Arctan < Lutaml::Model::Serializable
      include Base::Content::Arctan
    end

    class Arccot < Lutaml::Model::Serializable
      include Base::Content::Arccot
    end

    class Arccsc < Lutaml::Model::Serializable
      include Base::Content::Arccsc
    end

    class Arcsec < Lutaml::Model::Serializable
      include Base::Content::Arcsec
    end

    # Hyperbolic
    class Sinh < Lutaml::Model::Serializable
      include Base::Content::Sinh
    end

    class Cosh < Lutaml::Model::Serializable
      include Base::Content::Cosh
    end

    class Tanh < Lutaml::Model::Serializable
      include Base::Content::Tanh
    end

    class Sech < Lutaml::Model::Serializable
      include Base::Content::Sech
    end

    class Csch < Lutaml::Model::Serializable
      include Base::Content::Csch
    end

    class Coth < Lutaml::Model::Serializable
      include Base::Content::Coth
    end

    # Inverse hyperbolic
    class Arcsinh < Lutaml::Model::Serializable
      include Base::Content::Arcsinh
    end

    class Arccosh < Lutaml::Model::Serializable
      include Base::Content::Arccosh
    end

    class Arctanh < Lutaml::Model::Serializable
      include Base::Content::Arctanh
    end

    class Arccoth < Lutaml::Model::Serializable
      include Base::Content::Arccoth
    end

    class Arccsch < Lutaml::Model::Serializable
      include Base::Content::Arccsch
    end

    class Arcsech < Lutaml::Model::Serializable
      include Base::Content::Arcsech
    end
  end
end
