# frozen_string_literal: true

require "mml/v4/configuration"

module Mml
  module V4
    autoload :Namespace, "mml/v4/namespace"
    autoload :A, "mml/v4/a"
    autoload :Maction, "mml/v4/maction"
    autoload :Maligngroup, "mml/v4/maligngroup"
    autoload :Malignmark, "mml/v4/malignmark"
    autoload :Math, "mml/v4/math"
    autoload :Menclose, "mml/v4/menclose"
    autoload :Merror, "mml/v4/merror"
    autoload :Mfenced, "mml/v4/mfenced"
    autoload :Mfrac, "mml/v4/mfrac"
    autoload :Mfraction, "mml/v4/mfraction"
    autoload :Mglyph, "mml/v4/mglyph"
    autoload :Mi, "mml/v4/mi"
    autoload :Mlabeledtr, "mml/v4/mlabeledtr"
    autoload :Mlongdiv, "mml/v4/mlongdiv"
    autoload :Mmultiscripts, "mml/v4/mmultiscripts"
    autoload :Mn, "mml/v4/mn"
    autoload :Mo, "mml/v4/mo"
    autoload :Mover, "mml/v4/mover"
    autoload :Mpadded, "mml/v4/mpadded"
    autoload :Mphantom, "mml/v4/mphantom"
    autoload :Mprescripts, "mml/v4/mprescripts"
    autoload :Mroot, "mml/v4/mroot"
    autoload :Mrow, "mml/v4/mrow"
    autoload :Ms, "mml/v4/ms"
    autoload :Mscarries, "mml/v4/mscarries"
    autoload :Mscarry, "mml/v4/mscarry"
    autoload :Msgroup, "mml/v4/msgroup"
    autoload :Msline, "mml/v4/msline"
    autoload :Mspace, "mml/v4/mspace"
    autoload :Msqrt, "mml/v4/msqrt"
    autoload :Msrow, "mml/v4/msrow"
    autoload :Mstack, "mml/v4/mstack"
    autoload :Mstyle, "mml/v4/mstyle"
    autoload :Msub, "mml/v4/msub"
    autoload :Msubsup, "mml/v4/msubsup"
    autoload :Msup, "mml/v4/msup"
    autoload :Mtable, "mml/v4/mtable"
    autoload :Mtd, "mml/v4/mtd"
    autoload :Mtext, "mml/v4/mtext"
    autoload :Mtr, "mml/v4/mtr"
    autoload :Munder, "mml/v4/munder"
    autoload :Munderover, "mml/v4/munderover"
    autoload :None, "mml/v4/none"
    autoload :Semantics, "mml/v4/semantics"

    # Ensure that the CommonAttributes class is loaded after all
    # other classes
    require "mml/v4/common_attributes"

    def self.update_attributes
      Configuration::COMMON_ATTRIBUTES_CLASSES.each do |klass|
        const_get(klass).import_model(CommonAttributes)
      end
    end

    def self.parse(input, namespace_exist: true)
      Configuration.adapter ||= DEFAULT_ADAPTER

      return parse_with_no_namespace(input) unless namespace_exist

      Mml::V4::Math.from_xml(input)
    end

    def self.parse_with_no_namespace(input)
      with_ns = Nokogiri::XML.parse(input).tap do |doc|
        doc.root["xmlns"] = Namespace.uri
      end.to_xml

      Mml::V4::Math.from_xml(with_ns)
    end
  end
end

Mml::V4.update_attributes
