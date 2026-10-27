# frozen_string_literal: true

require "spec_helper"
require "mml/v3"

# rubocop:disable-next RSpec/SpecFilePathFormat, RSpec/DescribeClass
RSpec.describe "embedded usage without an explicit context" do
  # Embedded MML: a consumer document (e.g. a Metanorma presentation XML
  # carrying a MathML stem) parses the subtree through its own models and
  # serializes it with bare from_xml/to_xml — no register, no Mml::Vx.parse
  # (plurimath/mml#36). lutaml-model resolves these context-less operations
  # through the classes' declared lutaml_default_register; supported on
  # every adapter path since lutaml-model 0.8.65
  # (lutaml/lutaml-model#876), which is the gemspec floor.
  let(:input) do
    '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
      "<mmultiscripts><mi>R</mi><mn>1</mn>" \
      "<mprescripts/><mn>2</mn></mmultiscripts></math>"
  end

  it "parses with bare from_xml" do
    expect { Mml::V3::Math.from_xml(input) }.not_to raise_error
  end

  it "round-trips with bare from_xml/to_xml" do
    expect(Mml::V3::Math.from_xml(input).to_xml).to be_xml_equivalent_to(input)
  end

  it "keeps version-specific parsing on its own classes" do
    math = Mml::V3.parse(input)

    expect(math).to be_a(Mml::V3::Math)
    expect(math.to_xml).to be_xml_equivalent_to(input)
  end
end
