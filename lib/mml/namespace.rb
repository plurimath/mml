# frozen_string_literal: true

module Mml
  class Namespace < Lutaml::Xml::Namespace
    uri "http://www.w3.org/1998/Math/MathML"
    prefix_default "mml"
    element_form_default :unqualified
  end
end
