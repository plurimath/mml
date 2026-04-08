# frozen_string_literal: true

module Mml
  module V3
    class Annotation < CommonElements
      include Base::Content::Annotation
    end
    Configuration.register_model(Annotation, id: :annotation)
  end
end
