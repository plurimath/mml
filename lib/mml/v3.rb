# frozen_string_literal: true

require "lutaml/model"

Moxml::Config.default_adapter = Mml::DEFAULT_ADAPTER

require_relative "v3/configuration"
require_relative "v3/namespace"
require_relative "v3/common_elements"
require_relative "v3/maction"
require_relative "v3/maligngroup"
require_relative "v3/malignmark"
require_relative "v3/menclose"
require_relative "v3/merror"
require_relative "v3/mfenced"
require_relative "v3/mfrac"
require_relative "v3/mfraction"
require_relative "v3/mglyph"
require_relative "v3/mi"
require_relative "v3/mlongdiv"
require_relative "v3/mn"
require_relative "v3/mo"
require_relative "v3/mover"
require_relative "v3/mpadded"
require_relative "v3/mphantom"
require_relative "v3/mprescripts"
require_relative "v3/mroot"
require_relative "v3/mrow"
require_relative "v3/ms"
require_relative "v3/mscarries"
require_relative "v3/mscarry"
require_relative "v3/msgroup"
require_relative "v3/msline"
require_relative "v3/mspace"
require_relative "v3/msqrt"
require_relative "v3/msrow"
require_relative "v3/mstack"
require_relative "v3/mstyle"
require_relative "v3/msub"
require_relative "v3/msubsup"
require_relative "v3/msup"
require_relative "v3/mtd"
require_relative "v3/mtable"
require_relative "v3/mtext"
require_relative "v3/mtr"
require_relative "v3/mlabeledtr"
require_relative "v3/munder"
require_relative "v3/munderover"
require_relative "v3/mmultiscripts"
require_relative "v3/none"
require_relative "v3/semantics"
require_relative "v3/math"

module Mml
  module V3
    def self.parse(input, namespace_exist: true,
                   register: Configuration.register)
      Configuration.adapter ||= DEFAULT_ADAPTER
      xml = input
      xml = parse_with_no_namespace(input) unless namespace_exist

      klass = register.get_class(:math)
      klass.from_xml(xml, register: register)
    end

    def self.parse_with_no_namespace(input)
      Moxml.new(DEFAULT_ADAPTER).parse(input).tap do |doc|
        doc.root.add_namespace(nil, Namespace.uri)
      end.to_xml
    end
  end
end
