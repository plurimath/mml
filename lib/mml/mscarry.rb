require 'lutaml/model'

require_relative 'none'

class Mscarry < Lutaml::Model::Serializable
  attribute :mathcolor, :string
  attribute :mathbackground, :string
  attribute :location, :string
  attribute :crossout, :string
  attribute :none, None, collection: true

  xml do
    root 'mscarry'
    namespace 'http://www.w3.org/1998/Math/MathML', 'm'

    map_attribute 'mathcolor', to: :mathcolor
    map_attribute 'mathbackground', to: :mathbackground
    map_attribute 'location', to: :location
    map_attribute 'crossout', to: :crossout
    map_element 'none', to: :none
  end
end
