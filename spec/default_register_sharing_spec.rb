# frozen_string_literal: true

require "spec_helper"
require "mml/v3"

# rubocop:disable RSpec/SpecFilePathFormat, RSpec/DescribeClass
RSpec.describe "default register sharing" do
  # Embedded MML: a consumer document (e.g. a Metanorma presentation XML
  # carrying a MathML stem) parses the subtree through its own models and
  # serializes it with bare from_xml/to_xml — no register, no Mml::Vx.parse.
  # lutaml-model resolves those operations in the default context, so every
  # model id must be visible there (plurimath/mml#36).
  let(:input) do
    '<math xmlns="http://www.w3.org/1998/Math/MathML">' \
      "<mmultiscripts><mi>R</mi><mn>1</mn>" \
      "<mprescripts/><mn>2</mn></mmultiscripts></math>"
  end

  it "resolves :mmultiscripts in the default context" do
    expect(Lutaml::Model::GlobalContext.default_context.registry.lookup(:mmultiscripts))
      .to eq(Mml::V3::Mmultiscripts)
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
# rubocop:enable RSpec/SpecFilePathFormat, RSpec/DescribeClass
