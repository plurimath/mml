# frozen_string_literal: true

module Mml
  module V4
    class Mean < Lutaml::Model::Serializable
      include Base::Content::Mean
    end

    class Sdev < Lutaml::Model::Serializable
      include Base::Content::Sdev
    end

    class Variance < Lutaml::Model::Serializable
      include Base::Content::Variance
    end

    class Median < Lutaml::Model::Serializable
      include Base::Content::Median
    end

    class Mode < Lutaml::Model::Serializable
      include Base::Content::Mode
    end

    class Moment < Lutaml::Model::Serializable
      include Base::Content::Moment
    end

    class Momentabout < Lutaml::Model::Serializable
      include Base::Content::Momentabout
    end
  end
end
