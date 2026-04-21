# frozen_string_literal: true

require "spec_helper"

# Custom classes for substitution tests
module MmlSubst
  class V3Mi < Mml::V3::Mi
  end

  class V4Mi < Mml::V4::Mi
  end

  class V4Mover < Mml::V4::CommonElements
  end

  class V4Mi2 < Mml::V4::Mi
  end

  class LegacyMi < Mml::V3::Mi
  end
end

# rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations, RSpec/DescribeClass
RSpec.describe "Mml context support" do
  # Clear all GlobalContext caches before each test to ensure clean state
  # This helps avoid cache pollution issues in certain CI environments
  before do
    Lutaml::Model::GlobalContext.resolver.clear_all_caches
  end

  let(:v3_xml) do
    '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi>x</mi></math>'
  end

  let(:v4_xml) { File.read("spec/fixtures/v4/intent_basic.mml") }

  it "repopulates the built-in v3 context explicitly" do
    Mml::V3::Configuration.populate_context!

    math = Mml::V3.parse(v3_xml)
    expect(math).to be_a(Mml::V3::Math)
    expect(math.mi_value.first).to be_a(Mml::V3::Mi)
  end

  it "creates derived v3 contexts with fallback to the built-in context" do
    context = Mml::V3::Configuration.create_context(id: :custom_v3)
    math = Mml::V3.parse(v3_xml, context: :custom_v3)

    expect(context.fallback_ids).to eq([Mml::V3::Configuration.context_id])
    expect(math.mi_value.first).to be_a(Mml::V3::Mi)
  ensure
    Lutaml::Model::GlobalContext.unregister_context(:custom_v3)
  end

  it "supports substitutions in custom v3 contexts" do
    Mml::V3::Configuration.create_context(
      id: :custom_v3_substitution,
      substitutions: [
        { from_type: Mml::V3::Mi, to_type: MmlSubst::V3Mi },
      ],
    )

    math = Mml::V3.parse(v3_xml, context: :custom_v3_substitution)

    expect(math.mi_value.first).to be_a(MmlSubst::V3Mi)
    expect(math.to_xml(register: :custom_v3_substitution))
      .to be_xml_equivalent_to(v3_xml)
  ensure
    Lutaml::Model::GlobalContext.unregister_context(:custom_v3_substitution)
  end

  it "supports substitutions in custom v4 contexts via top-level parser" do
    Mml::V4::Configuration.create_context(
      id: :custom_v4_substitution,
      substitutions: [
        { from_type: Mml::V4::Mi, to_type: MmlSubst::V4Mi },
      ],
    )

    math = Mml.parse(v4_xml, version: 4, context: :custom_v4_substitution)

    expect(math).to be_a(Mml::V4::Math)
    expect(math.mfrac_value.first.mi_value.first).to be_a(MmlSubst::V4Mi)
    expect(math.to_xml(register: :custom_v4_substitution))
      .to be_xml_equivalent_to(v4_xml)
  ensure
    Lutaml::Model::GlobalContext.unregister_context(:custom_v4_substitution)
  end

  # rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
  it "warns and accepts register context ids" do
    Mml::V3::Configuration.create_context(id: :compat_v3)

    expect do
      math = Mml::V3.parse(v3_xml, register: :compat_v3)
      expect(math.mi_value.first).to be_a(Mml::V3::Mi)
    end.to output(/`register` is deprecated/).to_stderr
  ensure
    Lutaml::Model::GlobalContext.unregister_context(:compat_v3)
  end
  # rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations

  # Skipping on GHA: substitution tests fail due to GlobalContext type resolution
  # differences in GHA environment. These tests pass locally.
  # rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
  it "warns and accepts legacy register objects" do
    Mml::V3::Configuration.context

    legacy_register = Lutaml::Model::Register.new(
      :legacy_v3_register,
      fallback: [Mml::V3::Configuration.context_id],
    )
    legacy_register.register_model(MmlSubst::LegacyMi, id: :mi)

    math = nil
    expect do
      math = Mml::V3.parse(v3_xml, register: legacy_register)
    end.to output(/`register` is deprecated/).to_stderr
    expect(math.mi_value.first).to be_a(MmlSubst::LegacyMi)
  ensure
    Lutaml::Model::GlobalContext.unregister_context(:legacy_v3_register)
  end
  # rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations

  it "raises when both context and register are provided" do
    expect do
      Mml::V3.parse(v3_xml, context: :mml_v3, register: :mml_v3)
    end.to raise_error(ArgumentError, /either `context` or `register`/)
  end

  it "does not stamp classes with a global register fallback" do
    Mml::V3::Configuration.context

    math_has_register = Mml::V3::Math.instance_variable_defined?(:@register)
    mi_has_register = Mml::V3::Mi.instance_variable_defined?(:@register)
    expect([math_has_register, mi_has_register]).to all(be(false))
  end

  # Skipping on GHA: custom_models substitution tests fail due to GlobalContext
  # type resolution differences in GHA environment. These tests pass locally.
  it "supports custom_models= convenience API for container element substitution" do
    Mml::V4::Configuration.custom_models = { Mml::V4::Mover => MmlSubst::V4Mover }

    xml = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mover><mo>∫</mo><mi>b</mi></mover></math>'
    math = Mml::V4.parse(xml, context: :custom_models)

    expect(math.mover_value.first).to be_a(MmlSubst::V4Mover)
    expect(math.mover_value.first.mo_value.first.value).to eq("∫")
    expect(math.mover_value.first.mi_value.first.value).to eq(["b"])
  ensure
    Mml::V4::Configuration.clear_custom_models
  end

  it "uses custom_models as default context without explicit context: parameter" do
    Mml::V4::Configuration.custom_models = { Mml::V4::Mi => MmlSubst::V4Mi2 }

    math = Mml::V4.parse(v4_xml)

    expect(math.mfrac_value.first.mi_value.first).to be_a(MmlSubst::V4Mi2)
  ensure
    Mml::V4::Configuration.clear_custom_models
  end

  # rubocop:disable RSpec/ExampleLength
  it "supports direct v3 object construction with explicit context" do
    Mml::V3::Configuration.context
    math = Mml::V3::Math.new(
      lutaml_register: Mml::V3::Configuration.context_id,
      mi_value: [Mml::V3::Mi.new(value: "x", lutaml_register: Mml::V3::Configuration.context_id)],
    )

    expect(math.to_xml).to be_xml_equivalent_to(v3_xml)
  end

  # rubocop:disable RSpec/ExampleLength
  it "supports direct v4 object construction with explicit context" do
    Mml::V4::Configuration.context
    math = Mml::V4::Math.new(
      lutaml_register: Mml::V4::Configuration.context_id,
      mi_value: [Mml::V4::Mi.new(value: "x", lutaml_register: Mml::V4::Configuration.context_id)],
    )

    expect(math.to_xml).to be_xml_equivalent_to(v3_xml)
  end
end
# rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations, RSpec/DescribeClass
