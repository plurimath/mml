# frozen_string_literal: true

require "spec_helper"

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
