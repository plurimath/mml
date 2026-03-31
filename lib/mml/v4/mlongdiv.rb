# frozen_string_literal: true

module Mml::V4
  class Mlongdiv < Mml::V3::Mlongdiv
    attribute :mathbackground, :string
    attribute :longdivstyle, :string
    attribute :mathcolor, :string
    attribute :position, :integer
    attribute :shift, :integer
    attribute :intent, :string
    attribute :arg, :string

    xml do
      namespace Namespace
      element "mlongdiv"
      mixed_content

      map_attribute "mathbackground", to: :mathbackground
      map_attribute "longdivstyle", to: :longdivstyle
      map_attribute "mathcolor", to: :mathcolor
      map_attribute "position", to: :position
      map_attribute "shift", to: :shift
      map_attribute "intent", to: :intent
      map_attribute "arg", to: :arg
    end
  end
end
