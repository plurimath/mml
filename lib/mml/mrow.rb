# frozen_string_literal: true

module Mml
  class Munderover < Lutaml::Model::Serializable; end
  class Msubsup < Lutaml::Model::Serializable; end
  class Munder < Lutaml::Model::Serializable; end
  class Mstyle < Lutaml::Model::Serializable; end
  class Mtable < Lutaml::Model::Serializable; end
  class Mtext < Lutaml::Model::Serializable; end
  class Mfrac < Lutaml::Model::Serializable; end
  class Mover < Lutaml::Model::Serializable; end
  class Msub < Lutaml::Model::Serializable; end
  class Msup < Lutaml::Model::Serializable; end

  class Mrow < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mrow)

    SUPPORTED_TAGS = %w[
      munderover
      msubsup
      munder
      mstyle
      mtable
      mfrac
      mover
      mtext
      mrow
      msub
      msup
      mi
      mo
      mn
      ms
    ].freeze

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :dir, :string
    SUPPORTED_TAGS.each do |tag|
      attribute :"#{tag}_value", Mml.const_get(tag.capitalize), collection: true
    end

    xml do
      root "mrow"
      namespace "http://www.w3.org/1998/Math/MathML", nil

      map_element "mi", to: :mi
      map_element "mo", to: :mo
      map_element "mn", to: :mn
      map_element "ms", to: :ms
      map_element "mrow", to: :mrow
      map_element "mtext", to: :mtext
      map_element "mstyle", to: :mstyle
      map_element "munderover", to: :munderover
      map_attribute "dir", to: :dir
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "mathbackground", to: :mathbackground
      SUPPORTED_TAGS.each do |tag|
        map_element tag, to: :"#{tag}_value"
      end
    end
  end
end
