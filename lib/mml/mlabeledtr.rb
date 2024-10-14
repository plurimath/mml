# frozen_string_literal: true

require_relative "table_cell_expression"

module Mml
  class Mlabeledtr < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mlabeledtr)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :rowalign, :string
    attribute :columnalign, :string
    attribute :groupalign, :string
    attribute :table_cell_expression, TableCellExpression, collection: true

    xml do
      root "mlabeledtr"
      namespace "http://www.w3.org/1998/Math/MathML", "m"

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "rowalign", to: :rowalign
      map_attribute "columnalign", to: :columnalign
      map_attribute "groupalign", to: :groupalign
      map_element "TableCellExpression", to: :table_cell_expression
    end
  end
end
