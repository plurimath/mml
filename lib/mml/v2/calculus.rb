# frozen_string_literal: true

module Mml
  module V2
    class Int < Lutaml::Model::Serializable
      include Base::Content::Int
    end

    class Diff < Lutaml::Model::Serializable
      include Base::Content::Diff
    end

    class Partialdiff < Lutaml::Model::Serializable
      include Base::Content::Partialdiff
    end

    class Limit < Lutaml::Model::Serializable
      include Base::Content::Limit
    end

    class Lowlimit < Lutaml::Model::Serializable
      include Base::Content::Lowlimit
    end

    class Uplimit < Lutaml::Model::Serializable
      include Base::Content::Uplimit
    end

    class Tendsto < Lutaml::Model::Serializable
      include Base::Content::Tendsto
    end
  end
end
