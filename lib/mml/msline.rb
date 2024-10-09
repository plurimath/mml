require 'lutaml/model'

class Msline < Lutaml::Model::Serializable
  attribute :mathcolor, :string
  attribute :mathbackground, :string
  attribute :position, :integer
  attribute :length, :integer
  attribute :leftoverhang, :string
  attribute :rightoverhang, :string
  attribute :mslinethickness, :string

  xml do
    root 'msline'
    namespace 'http://www.w3.org/1998/Math/MathML', 'm'

    map_attribute 'mathcolor', to: :mathcolor
    map_attribute 'mathbackground', to: :mathbackground
    map_attribute 'position', to: :position
    map_attribute 'length', to: :length
    map_attribute 'leftoverhang', to: :leftoverhang
    map_attribute 'rightoverhang', to: :rightoverhang
    map_attribute 'mslinethickness', to: :mslinethickness
  end
end
