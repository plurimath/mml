# frozen_string_literal: true

require "spec_helper"

# Regression for the `&lt;` entity being silently dropped from `<mo>` elements
# when `Mml::V{3,4}::Math` is used as a typed attribute inside a host
# `Lutaml::Model::Serializable` that declares `mixed_content`.
#
# The host mirrors consumers like `Sts::NisoSts::InlineFormula`, which mix
# free-form text with a MathML island. The deserialization path must forward
# the child `<mml:math>` element to `Mml::V{3,4}::Math` as an adapter object
# (not a pre-decoded string) so that XML entities round-trip correctly.
#
# See BUG.mathml-lt-entity-dropped-in-mixed-content.md for background.
MATHML_NAMESPACE_URI = "http://www.w3.org/1998/Math/MathML"
ENTITY_DECODINGS = {
  "&lt;" => "<",
  "&gt;" => ">",
  "&amp;" => "&",
}.freeze
# rubocop:disable-next RSpec/DescribeClass, RSpec/ExampleLength, RSpec/MultipleExpectations
RSpec.describe "Mml::Math nested in a mixed_content host" do
  def formula_class_for(math_type)
    Class.new(Lutaml::Model::Serializable) do
      attribute :content, :string, collection: true
      attribute :math, math_type

      xml do
        element "inline-formula"
        mixed_content
        map_content to: :content
        map_element "math", to: :math
      end
    end
  end

  [Mml::V3, Mml::V4].each do |version|
    describe "#{version}::Math preserves XML entities inside <mo>" do
      let(:host_class) { formula_class_for(version::Math) }

      let(:bug_report_xml) do
        <<~XML
          <inline-formula>
            <mml:math xmlns:mml="#{MATHML_NAMESPACE_URI}">
              <mml:mstyle displaystyle="false">
                <mml:mn>50 000</mml:mn>
                <mml:mtext> v</mml:mtext>
                <mml:mo>&lt;</mml:mo>
                <mml:mi>m</mml:mi>
              </mml:mstyle>
            </mml:math>
          </inline-formula>
        XML
      end

      it "round-trips the reproduction from BUG.mathml-lt-entity-dropped-in-mixed-content.md" do
        formula = host_class.from_xml(bug_report_xml)
        mstyle = formula.math.mstyle_value.first
        mo = mstyle.mo_value.first

        expect(mo.value).to eq(["<"])
        expect(formula.math.to_xml).to include("&lt;")
      end

      it "does not produce an empty <mo></mo>" do
        formula = host_class.from_xml(bug_report_xml)
        serialized = formula.math.to_xml

        expect(serialized).not_to match(%r{<mo>\s*</mo>})
      end
    end

    describe "#{version}::Math preserves common XML entities in token elements" do
      let(:host_class) { formula_class_for(version::Math) }

      ENTITY_DECODINGS.each do |entity, decoded|
        it "round-trips <mo>#{entity}</mo>" do
          input = <<~XML
            <inline-formula>
              <mml:math xmlns:mml="#{MATHML_NAMESPACE_URI}">
                <mml:mo>#{entity}</mml:mo>
              </mml:math>
            </inline-formula>
          XML

          formula = host_class.from_xml(input)

          expect(formula.math.mo_value.first.value).to eq([decoded])
          expect(formula.math.to_xml).to be_xml_equivalent_to(
            "<math xmlns=\"#{MATHML_NAMESPACE_URI}\"><mo>#{entity}</mo></math>",
          )
        end
      end
    end

    describe "#{version}::Math preserves entities when text is interleaved around <math>" do
      let(:host_class) { formula_class_for(version::Math) }

      it "keeps text content alongside a less-than operator" do
        input = <<~XML
          <inline-formula>see <mml:math xmlns:mml="#{MATHML_NAMESPACE_URI}"><mml:mo>&lt;</mml:mo></mml:math> for details</inline-formula>
        XML

        formula = host_class.from_xml(input)

        expect(formula.content).to eq(["see ", " for details"])
        expect(formula.math.mo_value.first.value).to eq(["<"])
        expect(formula.math.to_xml).to include("&lt;")
      end
    end

    describe "#{version}::Math preserves multiple operators in sequence" do
      let(:host_class) { formula_class_for(version::Math) }

      it "round-trips a<b and b>c operators" do
        input = <<~XML
          <inline-formula>
            <mml:math xmlns:mml="#{MATHML_NAMESPACE_URI}">
              <mml:mi>a</mml:mi>
              <mml:mo>&lt;</mml:mo>
              <mml:mi>b</mml:mi>
              <mml:mo>&gt;</mml:mo>
              <mml:mi>c</mml:mi>
            </mml:math>
          </inline-formula>
        XML

        formula = host_class.from_xml(input)
        math = formula.math

        expect(math.mo_value.map(&:value)).to eq([["<"], [">"]])
        expect(math.mi_value.map(&:value)).to eq([%w[a], %w[b], %w[c]])
        expect(math.to_xml).to include("&lt;")
        expect(math.to_xml).to include("&gt;")
      end
    end
  end
end
