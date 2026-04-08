# frozen_string_literal: true

module Mml
  module V2
    class Annotation < Lutaml::Model::Serializable
      include Base::Content::Annotation
    end
  end
end
