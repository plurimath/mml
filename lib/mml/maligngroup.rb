require 'lutaml/model'

class Maligngroup < Lutaml::Model::Serializable
  attribute :mathcolor, :string
  attribute :mathbackground, :string
  attribute :groupalign, :string

  xml do
    root 'maligngroup'
    namespace 'http://www.w3.org/1998/Math/MathML', 'm'

    map_attribute 'mathcolor', to: :mathcolor
    map_attribute 'mathbackground', to: :mathbackground
    map_attribute 'groupalign', to: :groupalign
  end
end
