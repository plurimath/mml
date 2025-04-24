# frozen_string_literal: true

module Mml
  class Mlongdiv < CommonAttributes
    attribute :mathbackground, :string
    attribute :longdivstyle, :string
    attribute :mathcolor, :string
    attribute :position, :integer
    attribute :shift, :integer

    xml do
      root "mlongdiv", mixed: true

      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "longdivstyle", to: :longdivstyle, namespace: nil
      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "position", to: :position, namespace: nil
      map_attribute "shift", to: :shift, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Mlongdiv, id:  :mlongdiv)
end
