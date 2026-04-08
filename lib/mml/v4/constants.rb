# frozen_string_literal: true

module Mml
  module V4
    class Integers < Lutaml::Model::Serializable
      include Base::Content::Integers
    end

    class Reals < Lutaml::Model::Serializable
      include Base::Content::Reals
    end

    class Rationals < Lutaml::Model::Serializable
      include Base::Content::Rationals
    end

    class Naturalnumbers < Lutaml::Model::Serializable
      include Base::Content::Naturalnumbers
    end

    class Complexes < Lutaml::Model::Serializable
      include Base::Content::Complexes
    end

    class Primes < Lutaml::Model::Serializable
      include Base::Content::Primes
    end

    class Exponentiale < Lutaml::Model::Serializable
      include Base::Content::Exponentiale
    end

    class Imaginaryi < Lutaml::Model::Serializable
      include Base::Content::Imaginaryi
    end

    class Notanumber < Lutaml::Model::Serializable
      include Base::Content::Notanumber
    end

    class True < Lutaml::Model::Serializable
      include Base::Content::True
    end

    class False < Lutaml::Model::Serializable
      include Base::Content::False
    end

    class Emptyset < Lutaml::Model::Serializable
      include Base::Content::Emptyset
    end

    class Pi < Lutaml::Model::Serializable
      include Base::Content::Pi
    end

    class Eulergamma < Lutaml::Model::Serializable
      include Base::Content::Eulergamma
    end

    class Infinity < Lutaml::Model::Serializable
      include Base::Content::Infinity
    end
  end
end
