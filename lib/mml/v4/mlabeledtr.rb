# frozen_string_literal: true

module Mml
  module V4
    # @deprecated V4 spec removes <mlabeledtr> from the default schema.
    #   It is valid only in the mathml4-legacy schema for legacy content.
    class Mlabeledtr < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v4
      end
      include Base::Mlabeledtr
      include Base::V4Attributes

      xml do
        namespace Namespace
      end
    end
  end
end
