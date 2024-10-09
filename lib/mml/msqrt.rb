require 'lutaml/model'

class Msqrt < Lutaml::Model::Serializable
  attribute :mathcolor, :string
  attribute :mathbackground, :string

  xml do
    root 'msqrt'
    namespace 'http://www.w3.org/1998/Math/MathML', 'm'

    map_attribute 'mathcolor', to: :mathcolor
    map_attribute 'mathbackground', to: :mathbackground
  end
end
