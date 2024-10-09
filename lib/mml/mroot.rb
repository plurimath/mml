require 'lutaml/model'

class Mroot < Lutaml::Model::Serializable
  attribute :mathcolor, :string
  attribute :mathbackground, :string

  xml do
    root 'mroot'
    namespace 'http://www.w3.org/1998/Math/MathML', 'm'

    map_attribute 'mathcolor', to: :mathcolor
    map_attribute 'mathbackground', to: :mathbackground
  end
end
