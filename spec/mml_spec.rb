# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml do
  context "class loading" do
    it "loads all common attribute classes" do
      Mml::Configuration::COMMON_ATTRIBUTES_CLASSES.each do |class_name|
        klass = described_class.const_get(class_name)
        expect(klass).to be_a(Class)
      end
    end

    it "loads all supported tag classes" do
      Mml::Configuration::SUPPORTED_TAGS.each do |tag|
        klass = described_class.const_get(tag.to_s.capitalize)
        expect(klass).to be_a(Class)
      end
    end
  end

  context "with namespace" do
    Dir.glob("./spec/fixtures/with_namespace/*.mml").each do |file|
      it "round-trips #{File.basename(file, '.mml')}" do
        input = File.read(file)
        output = described_class.parse(input).to_xml
        expect(output).to be_xml_equivalent_to(input)
      end
    end
  end

  context "with namespace prefix" do
    Dir.glob("./spec/fixtures/with_namespace_prefix/*.mml").each do |file|
      it "round-trips #{File.basename(file, '.mml')}" do
        input = File.read(file)
        output = described_class.parse(input).to_xml(prefix: true)
        expect(output).to be_xml_equivalent_to(input)
      end
    end
  end

  context "without namespace" do
    Dir.glob("./spec/fixtures/without_namespace/*.mml").each do |file|
      it "round-trips #{File.basename(file, '.mml')}" do
        input = File.read(file)
        output = Mml.parse(input, namespace_exist: false).to_xml(declaration: false)

        output.sub!(/xmlns="[^"]+"/, "")
        expect(output).to be_xml_equivalent_to(input)
      end
    end
  end
end

RSpec.describe Mml::V4 do
  context "v4 round-trips" do
    Dir.glob("./spec/fixtures/v4/*.mml").each do |file|
      it "round-trips #{File.basename(file, '.mml')}" do
        input = File.read(file)
        output = described_class.parse(input).to_xml
        expect(output).to be_xml_equivalent_to(input)
      end
    end
  end
end
