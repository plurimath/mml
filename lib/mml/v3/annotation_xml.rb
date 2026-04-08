# frozen_string_literal: true

module Mml
  module V3
    class AnnotationXml < CommonElements
      include Base::Content::AnnotationXml
    end
    Configuration.register_model(AnnotationXml, id: :"annotation-xml")
  end
end
