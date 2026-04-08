# frozen_string_literal: true

module Mml
  module V3
    class Abs < Lutaml::Model::Serializable
      include Base::Content::Abs
    end
    Configuration.register_model(Abs, id: :abs)

    class Conjugate < Lutaml::Model::Serializable
      include Base::Content::Conjugate
    end
    Configuration.register_model(Conjugate, id: :conjugate)

    class Arg < Lutaml::Model::Serializable
      include Base::Content::Arg
    end
    Configuration.register_model(Arg, id: :arg)

    class Real < Lutaml::Model::Serializable
      include Base::Content::Real
    end
    Configuration.register_model(Real, id: :real)

    class Imaginary < Lutaml::Model::Serializable
      include Base::Content::Imaginary
    end
    Configuration.register_model(Imaginary, id: :imaginary)

    class Floor < Lutaml::Model::Serializable
      include Base::Content::Floor
    end
    Configuration.register_model(Floor, id: :floor)

    class Ceiling < Lutaml::Model::Serializable
      include Base::Content::Ceiling
    end
    Configuration.register_model(Ceiling, id: :ceiling)

    class Quotient < Lutaml::Model::Serializable
      include Base::Content::Quotient
    end
    Configuration.register_model(Quotient, id: :quotient)

    class Divide < Lutaml::Model::Serializable
      include Base::Content::Divide
    end
    Configuration.register_model(Divide, id: :divide)

    class Rem < Lutaml::Model::Serializable
      include Base::Content::Rem
    end
    Configuration.register_model(Rem, id: :rem)

    class Minus < Lutaml::Model::Serializable
      include Base::Content::Minus
    end
    Configuration.register_model(Minus, id: :minus)

    class Plus < Lutaml::Model::Serializable
      include Base::Content::Plus
    end
    Configuration.register_model(Plus, id: :plus)

    class Times < Lutaml::Model::Serializable
      include Base::Content::Times
    end
    Configuration.register_model(Times, id: :times)

    class Power < Lutaml::Model::Serializable
      include Base::Content::Power
    end
    Configuration.register_model(Power, id: :power)

    class Root < Lutaml::Model::Serializable
      include Base::Content::Root
    end
    Configuration.register_model(Root, id: :root)

    class Max < Lutaml::Model::Serializable
      include Base::Content::Max
    end
    Configuration.register_model(Max, id: :max)

    class Min < Lutaml::Model::Serializable
      include Base::Content::Min
    end
    Configuration.register_model(Min, id: :min)

    class Gcd < Lutaml::Model::Serializable
      include Base::Content::Gcd
    end
    Configuration.register_model(Gcd, id: :gcd)

    class Lcm < Lutaml::Model::Serializable
      include Base::Content::Lcm
    end
    Configuration.register_model(Lcm, id: :lcm)

    class Sum < Lutaml::Model::Serializable
      include Base::Content::Sum
    end
    Configuration.register_model(Sum, id: :sum)

    class Product < Lutaml::Model::Serializable
      include Base::Content::Product
    end
    Configuration.register_model(Product, id: :product)

    class Factorial < Lutaml::Model::Serializable
      include Base::Content::Factorial
    end
    Configuration.register_model(Factorial, id: :factorial)
  end
end
