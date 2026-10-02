# frozen_string_literal: true

require "spec_helper"

# Regression specs covering the mixed_content → ordered migration on
# element-only content models. Under `mixed_content`, lutaml-model's
# `each_mixed_content` yields inter-element whitespace as String children,
# which breaks consumers that do positional indexing
# (e.g., Plurimath's `msub_to_base` reads `children[0]` as the base).
#
# Under `ordered`, whitespace-only text nodes are skipped.
# These specs assert that contract for each positional-index element.
# If a base file drifts back to `mixed_content`, the corresponding spec
# below will fail.

# rubocop:disable-next RSpec/DescribeClass
RSpec.describe "ordered content" do
  def yielded_children(node)
    children = []
    node.each_mixed_content { |c| children << c }
    children
  end

  def expect_no_whitespace_strings(node)
    children = yielded_children(node)
    offenders = children.select { |c| c.is_a?(String) && c.strip.empty? }
    expect(offenders).to be_empty,
                         "expected no whitespace-only String children, " \
                         "got #{offenders.inspect} among #{children.inspect}"
  end

  shared_context "with namespace declared" do
    let(:xmlns) { 'xmlns="http://www.w3.org/1998/Math/MathML"' }
  end

  # rubocop:disable RSpec/EmptyExampleGroup
  positional_specs = {
    "msub" => ["<mi>t</mi>", "<mn>90</mn>"],
    "msup" => ["<mi>t</mi>", "<mn>90</mn>"],
    "msubsup" => ["<mi>t</mi>", "<mn>90</mn>", "<mn>2</mn>"],
    "mfrac" => ["<mn>1</mn>", "<mn>2</mn>"],
    "mroot" => ["<mi>x</mi>", "<mn>3</mn>"],
    "mover" => ["<mi>x</mi>", "<mo>^</mo>"],
    "munder" => ["<mi>x</mi>", "<mo>_</mo>"],
    "munderover" => ["<mi>x</mi>", "<mo>_</mo>", "<mo>^</mo>"],
  }

  container_specs = {
    "mrow" => ["<mi>a</mi>", "<mo>+</mo>", "<mi>b</mi>"],
    "mfenced" => ["<mi>a</mi>", "<mi>b</mi>"],
    "msgroup" => ["<mn>1</mn>", "<mn>2</mn>"],
  }
  # rubocop:enable RSpec/EmptyExampleGroup

  positional_specs.merge(container_specs).each do |tag, children_xml|
    [Mml::V3, Mml::V4].each do |version|
      describe "#{version} #{tag} with whitespace between children" do
        include_context "with namespace declared"

        let(:inner) { children_xml.join("\n  ") }
        let(:input) { "<math #{xmlns}><#{tag}>\n  #{inner}\n</#{tag}></math>" }
        let(:math)  { version.parse(input) }
        let(:node)  { math.public_send("#{tag}_value").first }

        it "does not yield whitespace-only String children from each_mixed_content" do
          expect_no_whitespace_strings(node)
        end

        it "round-trips the child elements" do
          expect(math.to_xml).to be_xml_equivalent_to(input)
        end
      end
    end
  end

  # Token elements should still preserve text + inline elements (mglyph,
  # malignmark) — they are the legitimate `mixed_content` use case per
  # MathML schema: token content is `(#PCDATA | mglyph | malignmark)*`.
  describe "token elements (genuine mixed content)" do
    include_context "with namespace declared"

    [Mml::V3, Mml::V4].each do |version|
      it "#{version}::Mi preserves inline malignmark inside text" do
        input = "<math #{xmlns}><mi>x<malignmark/>y</mi></math>"
        math = version.parse(input)
        mi = math.mi_value.first
        expect(mi.value).to eq(%w[x y])
        expect(mi.malignmark_value).not_to be_empty
      end

      it "#{version}::Mo captures inline mglyph" do
        input = %(<math #{xmlns}><mo>+<mglyph src="g.png" alt="g"/></mo></math>)
        math = version.parse(input)
        mo = math.mo_value.first
        expect(mo.value).to eq(["+"])
        expect(mo.mglyph_value.first.alt).to eq("g")
      end

      it "#{version}::Mtext preserves text and malignmark" do
        input = "<math #{xmlns}><mtext>hello<malignmark/>world</mtext></math>"
        math = version.parse(input)
        mtext = math.mtext_value.first
        expect(mtext.value).to eq(%w[hello world])
        expect(mtext.malignmark_value).not_to be_empty
      end

      it "#{version}::Mn captures inline mglyph" do
        input = %(<math #{xmlns}><mn>1<mglyph src="g.png" alt="g"/>2</mn></math>)
        math = version.parse(input)
        mn = math.mn_value.first
        expect(mn.value).to eq(%w[1 2])
        expect(mn.mglyph_value.first.alt).to eq("g")
      end

      it "#{version}::Ms captures inline malignmark" do
        input = "<math #{xmlns}><ms>a<malignmark/>b</ms></math>"
        math = version.parse(input)
        ms = math.ms_value.first
        expect(ms.value).to eq(%w[a b])
        expect(ms.malignmark_value).not_to be_empty
      end
    end
  end
end
