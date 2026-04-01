# frozen_string_literal: true

require "lutaml/model"

module Mml
  class Namespace < Lutaml::Xml::Namespace
    uri "http://www.w3.org/1998/Math/MathML"
    prefix_default "mml"
  end
end
