# frozen_string_literal: true

module Mml
  module V3
    class Mlongdiv < Lutaml::Model::Serializable
      import_model CommonElements

      attribute :mathbackground, :string
      attribute :longdivstyle, :string
      attribute :mathcolor, :string
      attribute :position, :integer
      attribute :shift, :integer

      xml do
        namespace Namespace
        element "mlongdiv"
        mixed_content

        map_attribute "mathbackground", to: :mathbackground
        map_attribute "longdivstyle", to: :longdivstyle
        map_attribute "mathcolor", to: :mathcolor
        map_attribute "position", to: :position
        map_attribute "shift", to: :shift
      end
    end
    Configuration.register.register_model(Mlongdiv, id: :mlongdiv)
  end
end
