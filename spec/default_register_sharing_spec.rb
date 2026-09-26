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

  let(:default_registry) do
    Lutaml::Model::GlobalContext.context(:default).registry
  end

  it "registers model ids in the default context" do
    resolved = default_registry.lookup(:mmultiscripts)

    expect(resolved).to be_a(Class)
    expect(resolved.name).to start_with("Mml::")
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

  it "targets :default regardless of the ambient default context" do
    original = default_registry.lookup(:mi)
    Lutaml::Model::GlobalContext.create_context(
      id: :host_app_context, registry: Lutaml::Model::TypeRegistry.new,
    )
    Lutaml::Model::GlobalContext.default_context_id = :host_app_context

    Mml::V3::Configuration.register_model(Mml::V3::Mi, id: :mi)

    expect(default_registry.lookup(:mi)).to eq(Mml::V3::Mi)
    expect(Lutaml::Model::GlobalContext.context(:host_app_context).registry.lookup(:mi))
      .to be_nil
  ensure
    default_registry.register(:mi, original) if original
    Lutaml::Model::GlobalContext.default_context_id = :default
    Lutaml::Model::GlobalContext.unregister_context(:host_app_context)
  end

  it "gives the last registration precedence in the default context" do
    original = default_registry.lookup(:mmultiscripts)

    Mml::V4::Configuration.register_model(Mml::V4::Mmultiscripts, id: :mmultiscripts)

    expect(default_registry.lookup(:mmultiscripts)).to eq(Mml::V4::Mmultiscripts)
  ensure
    default_registry.register(:mmultiscripts, original) if original
  end

  it "re-shares model ids when the version context is rebuilt" do
    original = default_registry.lookup(:mmultiscripts)

    Mml::V3::Configuration.populate_context!

    expect(default_registry.lookup(:mmultiscripts)).to eq(Mml::V3::Mmultiscripts)
  ensure
    default_registry.register(:mmultiscripts, original) if original
  end
end
# rubocop:enable RSpec/SpecFilePathFormat, RSpec/DescribeClass
