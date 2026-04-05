# frozen_string_literal: true

module Mml
  module Base
    module Mtable
      # NOTE: class_eval resolves constants in module's lexical scope.
      # Use fully qualified names (e.g., Mml::Namespace).
      def self.included(klass)
        klass.class_eval do
          attribute :mathcolor, :string
          attribute :mathbackground, :string
          attribute :align, :string
          attribute :rowalign, :string
          attribute :columnalign, :string
          attribute :alignmentscope, :string
          attribute :columnwidth, :string
          attribute :width, :string
          attribute :rowspacing, :string
          attribute :columnspacing, :string
          attribute :rowlines, :string
          attribute :columnlines, :string
          attribute :frame, :string
          attribute :framespacing, :string
          attribute :equalrows, :string
          attribute :equalcolumns, :string
          attribute :mlabeledtr_value, :mlabeledtr, collection: true
          attribute :mtr_value, :mtr, collection: true

          xml do
            namespace Mml::Namespace
            element "mtable"
            mixed_content

            map_attribute "mathcolor", to: :mathcolor
            map_attribute "mathbackground", to: :mathbackground
            map_attribute "align", to: :align
            map_attribute "rowalign", to: :rowalign
            map_attribute "columnalign", to: :columnalign
            map_attribute "alignmentscope", to: :alignmentscope
            map_attribute "columnwidth", to: :columnwidth
            map_attribute "width", to: :width
            map_attribute "rowspacing", to: :rowspacing
            map_attribute "columnspacing", to: :columnspacing
            map_attribute "rowlines", to: :rowlines
            map_attribute "columnlines", to: :columnlines
            map_attribute "frame", to: :frame
            map_attribute "framespacing", to: :framespacing
            map_attribute "equalrows", to: :equalrows
            map_attribute "equalcolumns", to: :equalcolumns
            map_element "mlabeledtr", to: :mlabeledtr_value
            map_element "mtr", to: :mtr_value
          end
        end
      end
    end
  end
end
