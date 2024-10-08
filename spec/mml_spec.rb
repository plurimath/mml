# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mml do
  context "with namespace" do
    Dir.glob("./spec/fixtures/with_namespace/*.mml").each do |file|
      it "round-trips #{File.basename(file, ".mml")}" do
        input = File.open(file).read
        output = Mml.parse(input, namespace_exist: true).to_xml
        expect(output).to be_equivalent_to(input)
      end
    end
  end

  context "without namespace" do
    Dir.glob("./spec/fixtures/without_namespace/*.mml").each do |file|
      it "round-trips #{File.basename(file, ".mml")}" do
        input = File.open(file).read
        output = Mml.parse(input, namespace_exist: false).to_xml
        expect(output).to be_equivalent_to(input)
      end
    end
  end
end
