# frozen_string_literal: true

module Mml
  module Base
    module V3Only
      # Table attributes removed in MathML 4: groupalign, side, minlabelspacing.
      # groupalign: no longer supported per spec.
      # side, minlabelspacing: removed with mlabeledtr per spec.
      # These are valid in mathml4-legacy schema only.
      module TableAttributes
        def self.included(klass)
          klass.class_eval do
            attribute :groupalign, :string
            attribute :side, :string
            attribute :minlabelspacing, :string

            xml do
              namespace Mml::Namespace
              map_attribute "groupalign", to: :groupalign
              map_attribute "side", to: :side
              map_attribute "minlabelspacing", to: :minlabelspacing
            end
          end
        end
      end
    end
  end
end
