# frozen_string_literal: true

module Mml
  class Munderover < Lutaml::Model::Serializable; end
  class Semantics < Lutaml::Model::Serializable; end
  class Mscarries < Lutaml::Model::Serializable; end
  class Msubsup < Lutaml::Model::Serializable; end
  class Msgroup < Lutaml::Model::Serializable; end
  class Mfenced < Lutaml::Model::Serializable; end
  class Munder < Lutaml::Model::Serializable; end
  class Mstyle < Lutaml::Model::Serializable; end
  class Mtable < Lutaml::Model::Serializable; end
  class Mspace < Lutaml::Model::Serializable; end
  class Mstack < Lutaml::Model::Serializable; end
  class Msline < Lutaml::Model::Serializable; end
  class Msrow < Lutaml::Model::Serializable; end
  class Mroot < Lutaml::Model::Serializable; end
  class Mtext < Lutaml::Model::Serializable; end
  class Mfrac < Lutaml::Model::Serializable; end
  class Msqrt < Lutaml::Model::Serializable; end
  class Mover < Lutaml::Model::Serializable; end
  class Msub < Lutaml::Model::Serializable; end
  class Msup < Lutaml::Model::Serializable; end

  class Mrow < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mrow)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :dir, :string
    attribute :intent, :string
    attribute :is_mrow, :boolean

    Mml::Configuration::SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "mrow"
      namespace "http://www.w3.org/1998/Math/MathML"

      map_attribute "dir", to: :dir, namespace: nil
      map_attribute "intent", to: :intent, namespace: nil
      map_attribute "mathcolor", to: :mathcolor, namespace: nil
      map_attribute "mathbackground", to: :mathbackground, namespace: nil
      map_element "is_mrow", to: :is_mrow

      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        map_element tag, to: :"#{tag}_value"
      end
    end
  end
end
