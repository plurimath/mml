# frozen_string_literal: true

module Mml
  class TableCellExpression < Lutaml::Model::Serializable
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :rowspan, :integer
    attribute :columnspan, :integer
    attribute :rowalign, :string
    attribute :columnalign, :string
    attribute :groupalign, :string

    xml do
      root "TableCellExpression"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "rowspan", to: :rowspan
      map_attribute "columnspan", to: :columnspan
      map_attribute "rowalign", to: :rowalign
      map_attribute "columnalign", to: :columnalign
      map_attribute "groupalign", to: :groupalign
    end
  end
end
