# frozen_string_literal: true

module Mml
  module V3
    class Mtable < Lutaml::Model::Serializable
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :align, :string
      attribute :rowalign, :string
      attribute :columnalign, :string
      attribute :groupalign, :string
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
      attribute :displaystyle, :string
      attribute :side, :string
      attribute :minlabelspacing, :string
      attribute :mlabeledtr_value, :mlabeledtr, collection: true
      attribute :mtr_value, :mtr, collection: true

      xml do
        namespace Namespace
        element "mtable"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "align", to: :align
        map_attribute "rowalign", to: :rowalign
        map_attribute "columnalign", to: :columnalign
        map_attribute "groupalign", to: :groupalign
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
        map_attribute "displaystyle", to: :displaystyle
        map_attribute "side", to: :side
        map_attribute "minlabelspacing", to: :minlabelspacing
        map_element "mlabeledtr", to: :mlabeledtr_value
        map_element "mtr", to: :mtr_value
      end
    end
    Configuration.register.register_model(Mtable, id: :mtable)
  end
end
