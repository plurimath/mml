# frozen_string_literal: true

module Mml
  module Base
    module Content
      module Csymbol
        def self.included(klass)
          klass.class_eval do
            attribute :type, :string
            attribute :definition_url, :string
            attribute :encoding_value, :string
            attribute :cd, :string
            attribute :value, :string

            # Presentation elements that can appear inside csymbol
            attribute :msub_value, :msub, collection: true
            attribute :msup_value, :msup, collection: true
            attribute :msubsup_value, :msubsup, collection: true
            attribute :munder_value, :munder, collection: true
            attribute :mover_value, :mover, collection: true
            attribute :munderover_value, :munderover, collection: true
            attribute :mfrac_value, :mfrac, collection: true
            attribute :msqrt_value, :msqrt, collection: true
            attribute :mroot_value, :mroot, collection: true
            attribute :mrow_value, :mrow, collection: true
            attribute :mfenced_value, :mfenced, collection: true
            attribute :menclose_value, :menclose, collection: true
            attribute :mphantom_value, :mphantom, collection: true
            attribute :mpadded_value, :mpadded, collection: true
            attribute :merror_value, :merror, collection: true
            attribute :mtext_value, :mtext, collection: true
            attribute :mspace_value, :mspace, collection: true
            attribute :mi_value, :mi, collection: true
            attribute :mo_value, :mo, collection: true
            attribute :mn_value, :mn, collection: true
            attribute :ms_value, :ms, collection: true
            attribute :none_value, :none, collection: true

            xml do
              namespace Mml::Namespace
              element "csymbol"
              mixed_content

              map_content to: :value
              map_attribute "type", to: :type
              map_attribute "definitionURL", to: :definition_url
              map_attribute "encoding", to: :encoding_value
              map_attribute "cd", to: :cd

              # Presentation elements
              map_element "msub", to: :msub_value
              map_element "msup", to: :msup_value
              map_element "msubsup", to: :msubsup_value
              map_element "munder", to: :munder_value
              map_element "mover", to: :mover_value
              map_element "munderover", to: :munderover_value
              map_element "mfrac", to: :mfrac_value
              map_element "msqrt", to: :msqrt_value
              map_element "mroot", to: :mroot_value
              map_element "mrow", to: :mrow_value
              map_element "mfenced", to: :mfenced_value
              map_element "menclose", to: :menclose_value
              map_element "mphantom", to: :mphantom_value
              map_element "mpadded", to: :mpadded_value
              map_element "merror", to: :merror_value
              map_element "mtext", to: :mtext_value
              map_element "mspace", to: :mspace_value
              map_element "mi", to: :mi_value
              map_element "mo", to: :mo_value
              map_element "mn", to: :mn_value
              map_element "ms", to: :ms_value
              map_element "none", to: :none_value
            end
          end
        end
      end
    end
  end
end
