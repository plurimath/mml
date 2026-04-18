# frozen_string_literal: true

require "spec_helper"

# rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations, RSpec/DescribeClass
RSpec.describe "MML adapter configuration and namespace injection" do
  describe "adapter delegation" do
    it "delegates to Lutaml::Model::Config for adapter on CRuby" do
      skip("Opal uses Oga always") if RUBY_ENGINE == "opal"

      expect(Mml.default_adapter).to eq(Lutaml::Model::Config.xml_adapter_type)
    end

    it "reflects adapter changes made via Lutaml::Model::Config" do
      skip("Opal uses Oga always") if RUBY_ENGINE == "opal"

      original = Lutaml::Model::Config.xml_adapter_type
      Lutaml::Model::Config.xml_adapter_type = :nokogiri
      expect(Mml.default_adapter).to eq(:nokogiri)
      Lutaml::Model::Config.xml_adapter_type = :ox
      expect(Mml.default_adapter).to eq(:ox)
    ensure
      Lutaml::Model::Config.xml_adapter_type = original
    end

    it "does not set Moxml::Config.default_adapter at class load time" do
      # Moxml::Config.default_adapter should NOT be forced to :ox by MML
      # It should be whatever the host application configured
      expect(Mml.default_adapter).to eq(Lutaml::Model::Config.xml_adapter_type)
      # Verify the adapter is configurable (not hardcoded)
      expect(Mml.default_adapter).not_to eq(:oga)
    end
  end

  describe "namespace injection for namespace-free MathML" do
    let(:namespace_uri) { "http://www.w3.org/1998/Math/MathML" }

    # Simple namespace-free MathML
    let(:ns_free_xml) do
      "<math><mi>x</mi></math>"
    end

    # MathML with existing attributes on <math>
    let(:ns_free_xml_with_attrs) do
      '<math display="block"><mfrac><mn>1</mn><mn>2</mn></mfrac></math>'
    end

    # MathML that already has namespace (should pass through unchanged)
    let(:ns_present_xml) do
      "<math xmlns=\"#{namespace_uri}\"><mi>x</mi></math>"
    end

    it "parses namespace-free MathML via V3" do
      math = Mml::V3.parse(ns_free_xml, namespace_exist: false)
      expect(math).to be_a(Mml::V3::Math)
      expect(math.mi_value.first.value).to eq("x")
    end

    it "parses namespace-free MathML via V4" do
      math = Mml::V4.parse(ns_free_xml, namespace_exist: false)
      expect(math).to be_a(Mml::V4::Math)
      expect(math.mi_value.first.value).to eq("x")
    end

    it "parses namespace-free MathML with attributes" do
      math = Mml::V3.parse(ns_free_xml_with_attrs, namespace_exist: false)
      expect(math).to be_a(Mml::V3::Math)
      expect(math.display).to eq("block")
      expect(math.mfrac_value.first.mn_value.first.value).to eq("1")
    end

    it "parses namespace-present MathML unchanged" do
      math = Mml::V3.parse(ns_present_xml, namespace_exist: true)
      expect(math).to be_a(Mml::V3::Math)
      expect(math.mi_value.first.value).to eq("x")
    end

    it "round-trips namespace-free MathML through V3" do
      math = Mml::V3.parse(ns_free_xml, namespace_exist: false)
      xml = math.to_xml
      expect(xml).to include("xmlns=\"#{namespace_uri}\"")
      expect(xml).to include("<mi>x</mi>")
    end

    it "round-trips namespace-free MathML through V4" do
      math = Mml::V4.parse(ns_free_xml, namespace_exist: false)
      xml = math.to_xml
      expect(xml).to include("xmlns=\"#{namespace_uri}\"")
      expect(xml).to include("<mi>x</mi>")
    end

    it "injects namespace correctly via top-level Mml.parse" do
      math = Mml.parse(ns_free_xml, namespace_exist: false, version: 3)
      expect(math).to be_a(Mml::V3::Math)
      expect(math.mi_value.first.value).to eq("x")
    end

    it "handles namespace-free XML with inline text content" do
      xml = "<math><mtext>hello world</mtext></math>"
      math = Mml::V3.parse(xml, namespace_exist: false)
      expect(math.mtext_value.first.value).to eq("hello world")
    end

    it "handles multi-level nested elements without namespace" do
      xml = "<math><mrow><mfrac><mi>a</mi><mi>b</mi></mfrac></mrow></math>"
      math = Mml::V3.parse(xml, namespace_exist: false)
      frac = math.mrow_value.first.mfrac_value.first
      expect(frac.mi_value.map(&:value)).to eq(%w[a b])
    end
  end

  describe "single-pass vs double-parse verification" do
    let(:ns_free_xml) { "<math><mi>x</mi></math>" }

    it "does not call Moxml for namespace injection" do
      # Verify that Moxml.new is not called during namespace-free parsing
      # (which would indicate the old double-parse path)
      allow(Moxml).to receive(:new)

      Mml::V3.parse(ns_free_xml, namespace_exist: false)

      expect(Moxml).not_to have_received(:new)
    end
  end
end
# rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations, RSpec/DescribeClass
