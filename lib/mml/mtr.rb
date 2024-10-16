# frozen_string_literal: true

require_relative "table_cell_expression"
require_relative "mtd"

module Mml
  class Mtr < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mtr)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :rowalign, :string
    attribute :columnalign, :string
    attribute :groupalign, :string
    attribute :table_cell_expression, TableCellExpression, collection: true
    attribute :mtd_value, Mtd, collection: true

    xml do
      root "mtr"
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      map_attribute "rowalign", to: :rowalign
      map_attribute "columnalign", to: :columnalign
      map_attribute "groupalign", to: :groupalign
      map_element "TableCellExpression", to: :table_cell_expression
      map_element "mtd", to: :mtd_value
    end
  end
end
