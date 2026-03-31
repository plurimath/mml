# frozen_string_literal: true

require "lutaml/model"
require "mml/v3/configuration"

DEFAULT_ADAPTER = :ox

Moxml::Config.default_adapter = DEFAULT_ADAPTER

module Mml::V3
  autoload :Namespace, "mml/v3/namespace"
  autoload :Maction, "mml/v3/maction"
  autoload :Maligngroup, "mml/v3/maligngroup"
  autoload :Malignmark, "mml/v3/malignmark"
  autoload :Math, "mml/v3/math"
  autoload :Menclose, "mml/v3/menclose"
  autoload :Merror, "mml/v3/merror"
  autoload :Mfenced, "mml/v3/mfenced"
  autoload :Mfrac, "mml/v3/mfrac"
  autoload :Mfraction, "mml/v3/mfraction"
  autoload :Mglyph, "mml/v3/mglyph"
  autoload :Mi, "mml/v3/mi"
  autoload :Mlabeledtr, "mml/v3/mlabeledtr"
  autoload :Mlongdiv, "mml/v3/mlongdiv"
  autoload :Mmultiscripts, "mml/v3/mmultiscripts"
  autoload :Mn, "mml/v3/mn"
  autoload :Mo, "mml/v3/mo"
  autoload :Mover, "mml/v3/mover"
  autoload :Mpadded, "mml/v3/mpadded"
  autoload :Mphantom, "mml/v3/mphantom"
  autoload :Mprescripts, "mml/v3/mprescripts"
  autoload :Mroot, "mml/v3/mroot"
  autoload :Mrow, "mml/v3/mrow"
  autoload :Ms, "mml/v3/ms"
  autoload :Mscarries, "mml/v3/mscarries"
  autoload :Mscarry, "mml/v3/mscarry"
  autoload :Msgroup, "mml/v3/msgroup"
  autoload :Msline, "mml/v3/msline"
  autoload :Mspace, "mml/v3/mspace"
  autoload :Msqrt, "mml/v3/msqrt"
  autoload :Msrow, "mml/v3/msrow"
  autoload :Mstack, "mml/v3/mstack"
  autoload :Mstyle, "mml/v3/mstyle"
  autoload :Msub, "mml/v3/msub"
  autoload :Msubsup, "mml/v3/msubsup"
  autoload :Msup, "mml/v3/msup"
  autoload :Mtable, "mml/v3/mtable"
  autoload :Mtd, "mml/v3/mtd"
  autoload :Mtext, "mml/v3/mtext"
  autoload :Mtr, "mml/v3/mtr"
  autoload :Munder, "mml/v3/munder"
  autoload :Munderover, "mml/v3/munderover"
  autoload :None, "mml/v3/none"
  autoload :Semantics, "mml/v3/semantics"

  # Ensure that the CommonAttributes class is loaded after all
  # other classes
  require "mml/v3/common_attributes"

  def self.update_attributes
    Configuration::COMMON_ATTRIBUTES_CLASSES.each do |klass|
      const_get(klass).import_model(CommonAttributes)
    end
  end

  def self.parse(input, namespace_exist: true)
    Configuration.adapter ||= DEFAULT_ADAPTER

    return parse_with_no_namespace(input) unless namespace_exist

    Mml::V3::Math.from_xml(input)
  end

  def self.parse_with_no_namespace(input)
    with_ns = Nokogiri::XML.parse(input).tap do |doc|
      doc.root["xmlns"] = Namespace.uri
    end.to_xml

    Mml::V3::Math.from_xml(with_ns)
  end
end

Mml::V3.update_attributes
