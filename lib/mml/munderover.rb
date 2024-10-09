require 'lutaml/model'

class Munderover < Lutaml::Model::Serializable
  attribute :mathcolor, :string
  attribute :mathbackground, :string
  attribute :accent, :string
  attribute :accentunder, :string
  attribute :align, :string

  xml do
    root 'munderover'
    namespace 'http://www.w3.org/1998/Math/MathML', 'm'

    map_attribute 'mathcolor', to: :mathcolor
    map_attribute 'mathbackground', to: :mathbackground
    map_attribute 'accent', to: :accent
    map_attribute 'accentunder', to: :accentunder
    map_attribute 'align', to: :align
  end
end
