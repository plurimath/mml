# frozen_string_literal: true

Moxml::Config.default_adapter = DEFAULT_ADAPTER

require_relative "v4/configuration"
require_relative "v4/namespace"
require_relative "v4/common_elements"
require_relative "v4/a"
require_relative "v4/maction"
require_relative "v4/maligngroup"
require_relative "v4/malignmark"
require_relative "v4/menclose"
require_relative "v4/merror"
require_relative "v4/mfenced"
require_relative "v4/mfrac"
require_relative "v4/mfraction"
require_relative "v4/mglyph"
require_relative "v4/mi"
require_relative "v4/mlongdiv"
require_relative "v4/mn"
require_relative "v4/mo"
require_relative "v4/mover"
require_relative "v4/mpadded"
require_relative "v4/mphantom"
require_relative "v4/mprescripts"
require_relative "v4/mroot"
require_relative "v4/mrow"
require_relative "v4/ms"
require_relative "v4/mscarries"
require_relative "v4/mscarry"
require_relative "v4/msgroup"
require_relative "v4/msline"
require_relative "v4/mspace"
require_relative "v4/msqrt"
require_relative "v4/msrow"
require_relative "v4/mstack"
require_relative "v4/mstyle"
require_relative "v4/msub"
require_relative "v4/msubsup"
require_relative "v4/msup"
require_relative "v4/mtd"
require_relative "v4/mtable"
require_relative "v4/mtext"
require_relative "v4/mtr"
require_relative "v4/mlabeledtr"
require_relative "v4/munder"
require_relative "v4/munderover"
require_relative "v4/mmultiscripts"
require_relative "v4/none"
require_relative "v4/semantics"
require_relative "v4/math"

module Mml
  module V4
    def self.parse(input, namespace_exist: true,
                   register: Configuration.register)
      Configuration.adapter ||= DEFAULT_ADAPTER

      unless namespace_exist
        return parse_with_no_namespace(input, register: register)
      end

      Mml::V4::Math.from_xml(input, register: register)
    end

    def self.parse_with_no_namespace(input, register: Configuration.register)
      with_ns = Moxml.new(DEFAULT_ADAPTER).parse(input).tap do |doc|
        doc.root.add_namespace(nil, Namespace.uri)
      end.to_xml

      Mml::V4::Math.from_xml(with_ns, register: register)
    end
  end
end
