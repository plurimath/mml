# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml::V4::Mi do
  describe "round-trip" do
    it "parses and serializes simple identifier" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi>x</mi></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "parses multi-character identifier" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi>sin</mi></math>'
      output = Mml::V4.parse(input).to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves value content" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi>D</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.value).to eq(["D"])
    end

    it "preserves mathvariant attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi mathvariant="script">L</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.mathvariant).to eq("script")
    end

    it "preserves mathsize attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi mathsize="big">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.mathsize).to eq("big")
    end

    it "preserves mathcolor attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi mathcolor="red">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.mathcolor).to eq("red")
    end

    it "preserves mathbackground attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi mathbackground="yellow">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.mathbackground).to eq("yellow")
    end

    it "round-trips complex variant" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi mathvariant="bold-italic">x</mi></math>'
      math = Mml::V4.parse(input)
      output = math.to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves id attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi id="var-x">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.id).to eq("var-x")
    end

    it "preserves class attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi class="variable">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.class_attr).to eq("variable")
    end

    it "preserves style attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi style="color:red">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.style_attr).to eq("color:red")
    end

    it "preserves href attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi href="https://example.com">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.href).to eq("https://example.com")
    end

    it "preserves xref attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi xref="ref-123">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.xref).to eq("ref-123")
    end

    it "round-trips common attributes" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi id="x" class="var" style="color:blue" href="http://ex.co">x</mi></math>'
      math = Mml::V4.parse(input)
      output = math.to_xml
      expect(output).to be_xml_equivalent_to(input)
    end

    it "preserves aria-label attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi aria-label="variable x">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.aria_label).to eq("variable x")
    end

    it "preserves aria-describedby attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi aria-describedby="desc1">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.aria_describedby).to eq("desc1")
    end

    it "preserves aria-description attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi aria-description="a variable">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.aria_description).to eq("a variable")
    end

    it "preserves aria-details attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi aria-details="details1">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.aria_details).to eq("details1")
    end

    it "preserves data-other attribute" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi data-other="custom">x</mi></math>'
      math = Mml::V4.parse(input)
      expect(math.mi_value.first.data_other).to eq("custom")
    end

    it "round-trips ARIA attributes" do
      input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi aria-label="test" aria-describedby="desc">x</mi></math>'
      math = Mml::V4.parse(input)
      output = math.to_xml
      expect(output).to be_xml_equivalent_to(input)
    end
  end
end
