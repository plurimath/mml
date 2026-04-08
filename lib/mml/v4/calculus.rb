# frozen_string_literal: true

module Mml
  module V4
    class Diff < Lutaml::Model::Serializable
      include Base::Content::Diff
    end

    class Partialdiff < Lutaml::Model::Serializable
      include Base::Content::Partialdiff
    end

    class Int < Lutaml::Model::Serializable
      include Base::Content::Int
    end

    class Lowlimit < Lutaml::Model::Serializable
      include Base::Content::Lowlimit
    end

    class Uplimit < Lutaml::Model::Serializable
      include Base::Content::Uplimit
    end
  end
end
