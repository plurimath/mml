# frozen_string_literal: true

module Mml
  class Maction < CommonAttributes
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :actiontype, :string
    attribute :selection, :string

    xml do
      root "maction"

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "actiontype", to: :actiontype, namespace: nil
      map_attribute "selection", to: :selection, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Maction, id:  :maction)
end
