# frozen_string_literal: true

module Mml
  module V3
    class Naturalnumbers < Lutaml::Model::Serializable
      include Base::Content::Naturalnumbers
    end
    Configuration.register_model(Naturalnumbers, id: :naturalnumbers)

    class Primes < Lutaml::Model::Serializable
      include Base::Content::Primes
    end
    Configuration.register_model(Primes, id: :primes)

    class Integers < Lutaml::Model::Serializable
      include Base::Content::Integers
    end
    Configuration.register_model(Integers, id: :integers)

    class Rationals < Lutaml::Model::Serializable
      include Base::Content::Rationals
    end
    Configuration.register_model(Rationals, id: :rationals)

    class Reals < Lutaml::Model::Serializable
      include Base::Content::Reals
    end
    Configuration.register_model(Reals, id: :reals)

    class Complexes < Lutaml::Model::Serializable
      include Base::Content::Complexes
    end
    Configuration.register_model(Complexes, id: :complexes)

    class Emptyset < Lutaml::Model::Serializable
      include Base::Content::Emptyset
    end
    Configuration.register_model(Emptyset, id: :emptyset)

    class Exponentiale < Lutaml::Model::Serializable
      include Base::Content::Exponentiale
    end
    Configuration.register_model(Exponentiale, id: :exponentiale)

    class Imaginaryi < Lutaml::Model::Serializable
      include Base::Content::Imaginaryi
    end
    Configuration.register_model(Imaginaryi, id: :imaginaryi)

    class Pi < Lutaml::Model::Serializable
      include Base::Content::Pi
    end
    Configuration.register_model(Pi, id: :pi)

    class Eulergamma < Lutaml::Model::Serializable
      include Base::Content::Eulergamma
    end
    Configuration.register_model(Eulergamma, id: :eulergamma)

    class Mtrue < Lutaml::Model::Serializable
      include Base::Content::True
    end
    Configuration.register_model(Mtrue, id: :true) # rubocop:disable Lint/BooleanSymbol

    class Mfalse < Lutaml::Model::Serializable
      include Base::Content::False
    end
    Configuration.register_model(Mfalse, id: :false) # rubocop:disable Lint/BooleanSymbol

    class Infinity < Lutaml::Model::Serializable
      include Base::Content::Infinity
    end
    Configuration.register_model(Infinity, id: :infinity)

    class Notanumber < Lutaml::Model::Serializable
      include Base::Content::Notanumber
    end
    Configuration.register_model(Notanumber, id: :notanumber)
  end
end
