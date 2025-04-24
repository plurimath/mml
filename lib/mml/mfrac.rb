# frozen_string_literal: true

module Mml
  class Mfrac < CommonAttributes
    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :linethickness, :string
    attribute :numalign, :string
    attribute :denomalign, :string
    attribute :bevelled, :string

    xml do
      root "mfrac", mixed: true

      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_attribute "linethickness", to: :linethickness, namespace: nil
      map_attribute "numalign", to: :numalign, namespace: nil
      map_attribute "denomalign", to: :denomalign, namespace: nil
      map_attribute "bevelled", to: :bevelled, namespace: nil
    end
  end
  Lutaml::Model::GlobalRegister.lookup(DEFAULT_REGISTER_ID).register_model(Mfrac, id:  :mfrac)
end
