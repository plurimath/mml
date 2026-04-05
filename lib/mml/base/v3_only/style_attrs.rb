# frozen_string_literal: true

module Mml
  module Base
    module V3Only
      # Style attributes removed in MathML 4.
      # fence, separator: removed from <mo> default schema.
      # groupalign, side, minlabelspacing: removed with mlabeledtr.
      module StyleAttributes
        def self.included(klass)
          klass.class_eval do
            attribute :fence, :string
            attribute :groupalign, :string
            attribute :separator, :string
            attribute :side, :string
            attribute :minlabelspacing, :string

            xml do
              namespace Mml::Namespace
              map_attribute "fence", to: :fence
              map_attribute "groupalign", to: :groupalign
              map_attribute "separator", to: :separator
              map_attribute "side", to: :side
              map_attribute "minlabelspacing", to: :minlabelspacing
            end
          end
        end
      end
    end
  end
end
