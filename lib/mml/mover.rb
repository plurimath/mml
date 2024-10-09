require 'lutaml/model'

class Mover < Lutaml::Model::Serializable
  attribute :mathcolor, :string
  attribute :mathbackground, :string
  attribute :accent, :string
  attribute :align, :string

  xml do
    root 'mover'
    namespace 'http://www.w3.org/1998/Math/MathML', 'm'

    map_attribute 'mathcolor', to: :mathcolor
    map_attribute 'mathbackground', to: :mathbackground
    map_attribute 'accent', to: :accent
    map_attribute 'align', to: :align
  end
end
