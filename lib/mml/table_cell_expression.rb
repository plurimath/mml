# frozen_string_literal: true

module Mml
  class TableCellExpression < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:tablecellexpression)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :rowspan, :integer
    attribute :columnspan, :integer
    attribute :rowalign, :string
    attribute :columnalign, :string
    attribute :groupalign, :string

    xml do
      root "TableCellExpression"
      namespace "http://www.w3.org/1998/Math/MathML"

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "rowspan", to: :rowspan, namespace: nil
      map_attribute "columnspan", to: :columnspan, namespace: nil
      map_attribute "rowalign", to: :rowalign, namespace: nil
      map_attribute "columnalign", to: :columnalign, namespace: nil
      map_attribute "groupalign", to: :groupalign, namespace: nil
    end
  end
end
