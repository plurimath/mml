# frozen_string_literal: true

module Mml
  class Munderover < Lutaml::Model::Serializable; end
  class Mstyle < Lutaml::Model::Serializable; end
  class Mtext < Lutaml::Model::Serializable; end

  class Mrow < Lutaml::Model::Serializable
    model Mml::Configuration.class_for(:mrow)

    attribute :mathcolor, :string
    attribute :mathbackground, :string
    attribute :dir, :string
    attribute :munderover, Mml::Munderover, collection: true
    attribute :mrow, Mml::Mrow, collection: true
    attribute :mstyle, Mml::Mstyle, collection: true
    attribute :mtext, Mml::Mtext, collection: true
    attribute :ms, Mml::Ms, collection: true
    attribute :mn, Mml::Mn, collection: true
    attribute :mi, Mml::Mi, collection: true
    attribute :mo, Mml::Mo, collection: true

    xml do
      root "mrow"

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
    end
  end
end
