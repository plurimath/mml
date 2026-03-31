# frozen_string_literal: true

require "lutaml/model"

module Mml
  class CommonElements < Lutaml::Model::Serializable
    attribute :mmultiscripts_value, :mmultiscripts, collection: true
    attribute :maligngroup_value, :maligngroup, collection: true
    attribute :malignmark_value, :malignmark, collection: true
    attribute :munderover_value, :munderover, collection: true
    attribute :semantics_value, :semantics, collection: true
    attribute :mscarries_value, :mscarries, collection: true
    attribute :mfraction_value, :mfraction, collection: true
    attribute :mphantom_value, :mphantom, collection: true
    attribute :menclose_value, :menclose, collection: true
    attribute :mlongdiv_value, :mlongdiv, collection: true
    attribute :mpadded_value, :mpadded, collection: true
    attribute :msubsup_value, :msubsup, collection: true
    attribute :mscarry_value, :mscarry, collection: true
    attribute :mfenced_value, :mfenced, collection: true
    attribute :msgroup_value, :msgroup, collection: true
    attribute :mglyph_value, :mglyph, collection: true
    attribute :mstack_value, :mstack, collection: true
    attribute :munder_value, :munder, collection: true
    attribute :mtable_value, :mtable, collection: true
    attribute :mstyle_value, :mstyle, collection: true
    attribute :mspace_value, :mspace, collection: true
    attribute :msline_value, :msline, collection: true
    attribute :merror_value, :merror, collection: true
    attribute :msrow_value, :msrow, collection: true
    attribute :mfrac_value, :mfrac, collection: true
    attribute :mover_value, :mover, collection: true
    attribute :mroot_value, :mroot, collection: true
    attribute :mtext_value, :mtext, collection: true
    attribute :msqrt_value, :msqrt, collection: true
    attribute :none_value, :none, collection: true
    attribute :mrow_value, :mrow, collection: true
    attribute :msub_value, :msub, collection: true
    attribute :msup_value, :msup, collection: true
    attribute :mi_value, :mi, collection: true
    attribute :mo_value, :mo, collection: true
    attribute :mn_value, :mn, collection: true
    attribute :ms_value, :ms, collection: true

    xml do
      map_element "mmultiscripts", to: :mmultiscripts_value
      map_element "maligngroup", to: :maligngroup_value
      map_element "malignmark", to: :malignmark_value
      map_element "munderover", to: :munderover_value
      map_element "semantics", to: :semantics_value
      map_element "mscarries", to: :mscarries_value
      map_element "mfraction", to: :mfraction_value
      map_element "mphantom", to: :mphantom_value
      map_element "menclose", to: :menclose_value
      map_element "mlongdiv", to: :mlongdiv_value
      map_element "mpadded", to: :mpadded_value
      map_element "msubsup", to: :msubsup_value
      map_element "mscarry", to: :mscarry_value
      map_element "mfenced", to: :mfenced_value
      map_element "msgroup", to: :msgroup_value
      map_element "mglyph", to: :mglyph_value
      map_element "mstack", to: :mstack_value
      map_element "munder", to: :munder_value
      map_element "mtable", to: :mtable_value
      map_element "mstyle", to: :mstyle_value
      map_element "mspace", to: :mspace_value
      map_element "msline", to: :msline_value
      map_element "merror", to: :merror_value
      map_element "msrow", to: :msrow_value
      map_element "mfrac", to: :mfrac_value
      map_element "mover", to: :mover_value
      map_element "mroot", to: :mroot_value
      map_element "mtext", to: :mtext_value
      map_element "msqrt", to: :msqrt_value
      map_element "none", to: :none_value
      map_element "mrow", to: :mrow_value
      map_element "msub", to: :msub_value
      map_element "msup", to: :msup_value
      map_element "mi", to: :mi_value
      map_element "mo", to: :mo_value
      map_element "mn", to: :mn_value
      map_element "ms", to: :ms_value
    end
  end
end
