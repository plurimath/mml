# frozen_string_literal: true

module Mml
  module V4
    class Eq < Lutaml::Model::Serializable
      include Base::Content::Eq
    end

    class Neq < Lutaml::Model::Serializable
      include Base::Content::Neq
    end

    class Lt < Lutaml::Model::Serializable
      include Base::Content::Lt
    end

    class Gt < Lutaml::Model::Serializable
      include Base::Content::Gt
    end

    class Leq < Lutaml::Model::Serializable
      include Base::Content::Leq
    end

    class Geq < Lutaml::Model::Serializable
      include Base::Content::Geq
    end

    class Equivalent < Lutaml::Model::Serializable
      include Base::Content::Equivalent
    end

    class Approx < Lutaml::Model::Serializable
      include Base::Content::Approx
    end
  end
end
