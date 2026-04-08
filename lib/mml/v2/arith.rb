# frozen_string_literal: true

module Mml
  module V2
    class Abs < Lutaml::Model::Serializable
      include Base::Content::Abs
    end

    class Conjugate < Lutaml::Model::Serializable
      include Base::Content::Conjugate
    end

    class Arg < Lutaml::Model::Serializable
      include Base::Content::Arg
    end

    class Real < Lutaml::Model::Serializable
      include Base::Content::Real
    end

    class Imaginary < Lutaml::Model::Serializable
      include Base::Content::Imaginary
    end

    class Floor < Lutaml::Model::Serializable
      include Base::Content::Floor
    end

    class Ceiling < Lutaml::Model::Serializable
      include Base::Content::Ceiling
    end

    class Quotient < Lutaml::Model::Serializable
      include Base::Content::Quotient
    end

    class Divide < Lutaml::Model::Serializable
      include Base::Content::Divide
    end

    class Rem < Lutaml::Model::Serializable
      include Base::Content::Rem
    end

    class Minus < Lutaml::Model::Serializable
      include Base::Content::Minus
    end

    class Plus < Lutaml::Model::Serializable
      include Base::Content::Plus
    end

    class Times < Lutaml::Model::Serializable
      include Base::Content::Times
    end

    class Power < Lutaml::Model::Serializable
      include Base::Content::Power
    end

    class Root < Lutaml::Model::Serializable
      include Base::Content::Root
    end

    class Max < Lutaml::Model::Serializable
      include Base::Content::Max
    end

    class Min < Lutaml::Model::Serializable
      include Base::Content::Min
    end

    class Gcd < Lutaml::Model::Serializable
      include Base::Content::Gcd
    end

    class Lcm < Lutaml::Model::Serializable
      include Base::Content::Lcm
    end

    class Sum < Lutaml::Model::Serializable
      include Base::Content::Sum
    end

    class Product < Lutaml::Model::Serializable
      include Base::Content::Product
    end

    class Factorial < Lutaml::Model::Serializable
      include Base::Content::Factorial
    end
  end
end
