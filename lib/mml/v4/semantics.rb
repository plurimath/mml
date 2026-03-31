# frozen_string_literal: true

module Mml::V4
  autoload(:Mi, "mml/v4/mi")

  class Semantics < Mml::V3::Semantics
    attribute :annotation, Mi, collection: true
    attribute :displaystyle, :string
    attribute :scriptlevel, :integer

    xml do
      namespace Namespace
      element "semantics"
      mixed_content

      map_element :annotation, to: :annotation
      map_attribute "displaystyle", to: :displaystyle
      map_attribute "scriptlevel", to: :scriptlevel
    end
  end
end
