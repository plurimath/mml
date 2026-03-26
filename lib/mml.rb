# frozen_string_literal: true

require "lutaml/model"
require "mml/configuration"
if RUBY_ENGINE == "opal"
  require_relative "mml/opal_setup"
end

DEFAULT_ADAPTER = if RUBY_ENGINE == "opal"
                    :oga
                  else
                    :ox
                  end

Moxml::Config.default_adapter = DEFAULT_ADAPTER

module Mml
  class Error < StandardError; end

  # autoload :CommonAttributes, "mml/common_attributes"
  autoload :Namespace, "mml/namespace"
  autoload :Maction, "mml/maction"
  autoload :Maligngroup, "mml/maligngroup"
  autoload :Malignmark, "mml/malignmark"
  autoload :Math, "mml/math"
  autoload :Menclose, "mml/menclose"
  autoload :Merror, "mml/merror"
  autoload :Mfenced, "mml/mfenced"
  autoload :Mfrac, "mml/mfrac"
  autoload :Mfraction, "mml/mfraction"
  autoload :Mglyph, "mml/mglyph"
  autoload :Mi, "mml/mi"
  autoload :Mlabeledtr, "mml/mlabeledtr"
  autoload :Mlongdiv, "mml/mlongdiv"
  autoload :Mmultiscripts, "mml/mmultiscripts"
  autoload :Mn, "mml/mn"
  autoload :Mo, "mml/mo"
  autoload :Mover, "mml/mover"
  autoload :Mpadded, "mml/mpadded"
  autoload :Mphantom, "mml/mphantom"
  autoload :Mprescripts, "mml/mprescripts"
  autoload :Mroot, "mml/mroot"
  autoload :Mrow, "mml/mrow"
  autoload :Ms, "mml/ms"
  autoload :Mscarries, "mml/mscarries"
  autoload :Mscarry, "mml/mscarry"
  autoload :Msgroup, "mml/msgroup"
  autoload :Msline, "mml/msline"
  autoload :Mspace, "mml/mspace"
  autoload :Msqrt, "mml/msqrt"
  autoload :Msrow, "mml/msrow"
  autoload :Mstack, "mml/mstack"
  autoload :Mstyle, "mml/mstyle"
  autoload :Msub, "mml/msub"
  autoload :Msubsup, "mml/msubsup"
  autoload :Msup, "mml/msup"
  autoload :Mtable, "mml/mtable"
  autoload :Mtd, "mml/mtd"
  autoload :Mtext, "mml/mtext"
  autoload :Mtr, "mml/mtr"
  autoload :Munder, "mml/munder"
  autoload :Munderover, "mml/munderover"
  autoload :None, "mml/none"
  autoload :Semantics, "mml/semantics"

  module_function

  def config
    Configuration.config
  end

  # TODO: We should do this lazily in lutaml-model, i.e. using include instead
  # of import_model.
  def update_attributes
    Configuration::COMMON_ATTRIBUTES_CLASSES.each do |klass|
      const_get(klass).import_model(CommonAttributes)
    end
  end

  def parse(input, namespace_exist: true)
    Configuration.adapter ||= DEFAULT_ADAPTER

    # TODO: If there is no namespace we should treat it as having an ex-vivo
    # assigned namespace.
    # For now, use Moxml to inject the namespace if it is missing, and then
    # parse the XML into a MathML object

    unless namespace_exist
      input = Moxml.parse(input).tap do |doc|
        doc.root["xmlns"] = Namespace.uri
      end.to_xml
    end

    Mml::Math.from_xml(input)
  end
end

# Ensure that the CommonAttributes class is loaded after all
# other classes
require "mml/common_attributes"

Mml.update_attributes
