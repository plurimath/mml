require 'lutaml/model'

require_relative 'malignmark'
require_relative 'mglyph'

class Mi < Lutaml::Model::Serializable
  model Plurimath::Math::Symbols::Symbol

  attribute :value, :string
  # attribute :mathcolor, :string
  # attribute :mathbackground, :string
  # attribute :mathvariant, :string
  # attribute :mathsize, :string
  # attribute :dir, :string
  # attribute :fontfamily, :string
  # attribute :fontweight, :string
  # attribute :fontstyle, :string
  # attribute :fontsize, :string
  # attribute :color, :string
  # attribute :background, :string
  # attribute :mglyph, Mglyph, collection: true
  # attribute :malignmark, Malignmark, collection: true

  xml do
    root 'mi'
    namespace 'http://www.w3.org/1998/Math/MathML', 'm'

    map_content with: { to: :to_value, from: :from_value }
    map_attribute 'mathcolor', with: { to: :to_math_color, from: :from_math_color }
    # map_attribute 'mathbackground', to: :mathbackground
    # map_attribute 'mathvariant', to: :mathvariant
    # map_attribute 'mathsize', to: :mathsize
    # map_attribute 'dir', to: :dir
    # map_attribute 'fontfamily', to: :fontfamily
    # map_attribute 'fontweight', to: :fontweight
    # map_attribute 'fontstyle', to: :fontstyle
    # map_attribute 'fontsize', to: :fontsize
    # map_attribute 'color', to: :color
    # map_attribute 'background', to: :background
    # map_element 'mglyph', to: :mglyph
    # map_element 'malignmark', to: :malignmark
  end

  def from_math_color(model, value)
    new_model = Plurimath::Math::Function::Color.new(
      nil,
      value
    )
    self.class.instance_variable_set(:@color_model, new_model)
  end

  def to_math_color(**); end
end
