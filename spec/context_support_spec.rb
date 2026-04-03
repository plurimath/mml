# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Mml context support" do
  let(:v3_xml) do
    '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi>x</mi></math>'
  end

  let(:v4_xml) { File.read("spec/fixtures/v4/intent_basic.mml") }

  it "repopulates the built-in v3 context explicitly" do
    Lutaml::Model::GlobalContext.reset!
    Mml::V3::Configuration.populate_context!

    math = Mml.parse(v3_xml)

    expect(math).to be_a(Mml::V3::Math)
    expect(math.mi_value.first).to be_a(Mml::V3::Mi)
  ensure
    Mml::V4::Configuration.populate_context!
  end

  it "creates derived v3 contexts with fallback to the built-in context" do
    context = Mml::V3::Configuration.create_context(id: :custom_v3)
    math = Mml::V3.parse(v3_xml, context: :custom_v3)

    expect(context.fallback_ids).to eq([Mml::V3::Configuration.context_id])
    expect(math.mi_value.first).to be_a(Mml::V3::Mi)
  end

  it "supports substitutions in custom v3 contexts" do
    stub_const("CustomV3Mi", Class.new(Mml::V3::Mi))
    Mml::V3::Configuration.create_context(
      id: :custom_v3_substitution,
      substitutions: [
        { from_type: Mml::V3::Mi, to_type: CustomV3Mi },
      ],
    )

    math = Mml::V3.parse(v3_xml, context: :custom_v3_substitution)

    expect(math.mi_value.first).to be_a(CustomV3Mi)
    expect(math.to_xml(register: :custom_v3_substitution)).to be_xml_equivalent_to(v3_xml)
  end

  it "supports substitutions in custom v4 contexts through the top-level parser" do
    stub_const("CustomV4Mi", Class.new(Mml::V4::Mi))
    Mml::V4::Configuration.create_context(
      id: :custom_v4_substitution,
      substitutions: [
        { from_type: Mml::V4::Mi, to_type: CustomV4Mi },
      ],
    )

    math = Mml.parse(v4_xml, version: 4, context: :custom_v4_substitution)

    expect(math).to be_a(Mml::V4::Math)
    expect(math.mfrac_value.first.mi_value.first).to be_a(CustomV4Mi)
    expect(math.to_xml(register: :custom_v4_substitution)).to be_xml_equivalent_to(v4_xml)
  end

  it "warns and accepts register context ids" do
    Mml::V3::Configuration.create_context(id: :compat_v3)

    expect do
      math = Mml::V3.parse(v3_xml, register: :compat_v3)
      expect(math.mi_value.first).to be_a(Mml::V3::Mi)
    end.to output(/`register` is deprecated/).to_stderr
  end

  it "warns and accepts legacy register objects" do
    stub_const("LegacyRegisterMi", Class.new(Mml::V3::Mi))
    Mml::V3::Configuration.context

    legacy_register = Lutaml::Model::Register.new(
      :legacy_v3_register,
      fallback: [Mml::V3::Configuration.context_id],
    )
    legacy_register.register_model(LegacyRegisterMi, id: :mi)

    expect do
      math = Mml::V3.parse(v3_xml, register: legacy_register)
      expect(math.mi_value.first).to be_a(LegacyRegisterMi)
    end.to output(/`register` is deprecated/).to_stderr
  end

  it "raises when both context and register are provided" do
    expect do
      Mml::V3.parse(v3_xml, context: :mml_v3, register: :mml_v3)
    end.to raise_error(ArgumentError, /either `context` or `register`/)
  end

  it "does not stamp classes with a global register fallback" do
    Mml::V3::Configuration.context

    expect(Mml::V3::Math.instance_variable_defined?(:@register)).to be(false)
    expect(Mml::V3::Mi.instance_variable_defined?(:@register)).to be(false)
  end

  it "supports direct v3 object construction and serialization with an explicit context" do
    Mml::V3::Configuration.context
    math = Mml::V3::Math.new(
      lutaml_register: Mml::V3::Configuration.context_id,
      mi_value: [Mml::V3::Mi.new(value: "x")],
    )

    expect(math.to_xml).to be_xml_equivalent_to(v3_xml)
  end

  it "supports direct v4 object construction and serialization with an explicit context" do
    Mml::V4::Configuration.context
    math = Mml::V4::Math.new(
      lutaml_register: Mml::V4::Configuration.context_id,
      mi_value: [Mml::V4::Mi.new(value: "x")],
    )

    expect(math.to_xml).to be_xml_equivalent_to(v3_xml)
  end
end
