# frozen_string_literal: true

module Mml
  module V2
    class Eq < Lutaml::Model::Serializable
      include Base::Content::Eq
    end

    class Neq < Lutaml::Model::Serializable
      include Base::Content::Neq
    end

    class Leq < Lutaml::Model::Serializable
      include Base::Content::Leq
    end

    class Lt < Lutaml::Model::Serializable
      include Base::Content::Lt
    end

    class Geq < Lutaml::Model::Serializable
      include Base::Content::Geq
    end

    class Gt < Lutaml::Model::Serializable
      include Base::Content::Gt
    end

    class Equivalent < Lutaml::Model::Serializable
      include Base::Content::Equivalent
    end

    class Approx < Lutaml::Model::Serializable
      include Base::Content::Approx
    end

    class Factorof < Lutaml::Model::Serializable
      include Base::Content::Factorof
    end
  end
end
