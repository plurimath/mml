# frozen_string_literal: true

require "spec_helper"
require "mml/v4"

# rubocop:disable-next RSpec/SpecFilePathFormat, RSpec/DescribeClass
RSpec.describe "V4 wildcard attributes (data-*/on*)" do
  # MathML 4 allows data-* and on* attributes on every element
  # (plurimath/mml#23). lutaml-model's map_all_attributes captures the
  # unclaimed attributes into `other_attributes` and emits them back on
  # serialize, so round-trips preserve them.
  let(:namespaced_input) do
    "<math xmlns='http://www.w3.org/1998/Math/MathML' " \
      "xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'>" \
      "<mi id='i' mathcolor='red' data-foo='1' onclick='x()' " \
      "xsi:type='t'>x</mi></math>"
  end

  it "captures data-*/on* on presentation elements" do
    input = "<math xmlns='http://www.w3.org/1998/Math/MathML'>" \
            "<mi id='i' mathcolor='red' data-foo='1' onclick='x()'>x</mi></math>"
    mi = Mml::V4.parse(input).mi_value.first

    expect(mi.other_attributes).to eq("data-foo" => "1", "onclick" => "x()")
    expect(mi.id).to eq("i")
    expect(mi.mathcolor).to eq("red")
  end

  it "captures namespaced attributes under their local name" do
    math = Mml::V4.parse(namespaced_input)

    expect(math.mi_value.first.other_attributes).to include("type" => "t")
  end

  it "round-trips data-*/on* through to_xml" do
    output = Mml::V4.parse(namespaced_input).to_xml

    expect(output).to include('data-foo="1"')
      .and include('onclick="x()"')
      .and include('id="i"')
      .and include('mathcolor="red"')
  end

  it "captures data-* on content elements" do
    input = "<math xmlns='http://www.w3.org/1998/Math/MathML'>" \
            "<cn data-name='n'>1</cn></math>"
    math = Mml::V4.parse(input)
    cn = math.cn_value.first

    expect(cn.other_attributes).to eq("data-name" => "n")
    expect(math.to_xml).to include('data-name="n"')
  end

  it "leaves models untouched when no wildcard attributes are present" do
    input = "<math xmlns='http://www.w3.org/1998/Math/MathML'>" \
            "<mi>x</mi></math>"
    math = Mml::V4.parse(input)
    other = math.mi_value.first.other_attributes

    expect(Lutaml::Model::Utils.uninitialized?(other) || other.nil?)
      .to be(true)
    expect(math.to_xml).to be_xml_equivalent_to(input)
  end
end
