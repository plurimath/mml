# frozen_string_literal: true

module Mml
  class Msrow < CommonAttributes
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :position, :integer

    xml do
      root "msrow", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "position", to: :position, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Msrow, id:  :msrow)
end
