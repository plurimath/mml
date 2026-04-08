# frozen_string_literal: true

module Mml
  module V4
    class AnnotationXml < CommonElements
      include Base::Content::AnnotationXml
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
