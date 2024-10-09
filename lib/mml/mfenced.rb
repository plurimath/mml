require 'lutaml/model'

class Mfenced < Lutaml::Model::Serializable
  attribute :mathcolor, :string
  attribute :mathbackground, :string
  attribute :open, :string
  attribute :close, :string
  attribute :separators, :string

  xml do
    root 'mfenced'
    namespace 'http://www.w3.org/1998/Math/MathML', 'm'

    map_attribute 'mathcolor', to: :mathcolor
    map_attribute 'mathbackground', to: :mathbackground
    map_attribute 'open', to: :open
    map_attribute 'close', to: :close
    map_attribute 'separators', to: :separators
  end
end
