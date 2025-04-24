# frozen_string_literal: true

module Mml
  class Maligngroup < CommonAttributes
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :groupalign, :string

    xml do
      root "maligngroup"

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "groupalign", to: :groupalign, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Maligngroup, id:  :maligngroup)
end
