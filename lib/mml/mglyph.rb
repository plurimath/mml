require 'lutaml/model'

class Mglyph < Lutaml::Model::Serializable
  attribute :mathcolor, :string
  attribute :mathbackground, :string
  attribute :src, :string
  attribute :width, :string
  attribute :height, :string
  attribute :valign, :string
  attribute :alt, :string
  attribute :index, :integer
  attribute :mathvariant, :string
  attribute :mathsize, :string
  attribute :fontfamily, :string
  attribute :fontweight, :string
  attribute :fontstyle, :string
  attribute :fontsize, :string
  attribute :color, :string
  attribute :background, :string

  xml do
    root 'mglyph'
    namespace 'http://www.w3.org/1998/Math/MathML', 'm'

    map_attribute 'mathcolor', to: :mathcolor
    map_attribute 'mathbackground', to: :mathbackground
    map_attribute 'src', to: :src
    map_attribute 'width', to: :width
    map_attribute 'height', to: :height
    map_attribute 'valign', to: :valign
    map_attribute 'alt', to: :alt
    map_attribute 'index', to: :index
    map_attribute 'mathvariant', to: :mathvariant
    map_attribute 'mathsize', to: :mathsize
    map_attribute 'fontfamily', to: :fontfamily
    map_attribute 'fontweight', to: :fontweight
    map_attribute 'fontstyle', to: :fontstyle
    map_attribute 'fontsize', to: :fontsize
    map_attribute 'color', to: :color
    map_attribute 'background', to: :background
  end
end
