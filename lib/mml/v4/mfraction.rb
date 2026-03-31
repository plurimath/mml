# frozen_string_literal: true

module Mml
  module V4
    class Mfraction < Mml::V3::Mfraction
      attribute :mathcolor, :string
      attribute :mathbackground, :string
      attribute :linethickness, :string
      attribute :numalign, :string
      attribute :denomalign, :string
      attribute :bevelled, :string
      attribute :intent, :string
      attribute :arg, :string

      xml do
        namespace Namespace
        element "mfraction"
        mixed_content

        map_attribute "mathcolor", to: :mathcolor
        map_attribute "mathbackground", to: :mathbackground
        map_attribute "linethickness", to: :linethickness
        map_attribute "numalign", to: :numalign
        map_attribute "denomalign", to: :denomalign
        map_attribute "bevelled", to: :bevelled
        map_attribute "intent", to: :intent
        map_attribute "arg", to: :arg
      end
    end
  end
end
