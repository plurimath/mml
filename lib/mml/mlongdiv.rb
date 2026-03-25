# frozen_string_literal: true

module Mml
  class Mlongdiv < Lutaml::Model::Serializable
    attribute :mathbackground, :string
    attribute :longdivstyle, :string
    attribute :mathcolor, :string
    attribute :position, :integer
    attribute :shift, :integer

    xml do
      element "mlongdiv"
      mixed_content

      map_attribute "mathbackground", to: :mathbackground
      map_attribute "longdivstyle", to: :longdivstyle
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "position", to: :position
      map_attribute "shift", to: :shift
    end
  end
end
