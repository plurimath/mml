# frozen_string_literal: true

require "spec_helper"

# Architectural lint checks + smoke tests for the autoload migration.
#
# These specs lock in:
# - No `require_relative` for internal library code (use `autoload`).
# - No `respond_to?` for type checking (use `is_a?`).
# - No `send` to bypass visibility, no `instance_variable_set/get`.
# - Every versioned Mml class is reachable via autoload and registered in
#   its version's context after `require "mml"`.
#
# If a future commit regresses any of these, the corresponding example fails.

# Element IDs the gem promises to support, derived from MathML schema.
# V2 lacks the V3+ content elements (cbytes/cerror/cs/declare/share).
# V4 dropped logbase and domainofapplication per MathML 4 spec.
COMMON_ELEMENT_IDS = %i[
  math mi mn mo ms mtext
  mfrac mroot msqrt mstyle merror mpadded mphantom mfenced menclose
  msub msup msubsup munder mover munderover mmultiscripts mprescripts
  mtable mtr mlabeledtr mtd maligngroup malignmark maction mrow
  mspace msline msgroup msrow mstack mscarries mscarry mlongdiv
  mfraction mglyph none semantics
  apply ci cn csymbol annotation annotation-xml bind
  bvar condition degree interval inverse lambda otherwise piece piecewise
  sep fn reln
  abs conjugate arg real imaginary floor ceiling quotient divide rem
  minus plus times power root max min gcd lcm sum product factorial
  int diff partialdiff limit lowlimit uplimit tendsto
  exp ln log
  sin cos tan sec csc cot
  arcsin arccos arctan arccsc arcsec arccot
  sinh cosh tanh sech csch coth
  arcsinh arccosh arctanh arcsech arccsch arccoth
  and or xor not exists forall implies
  compose domain codomain image ident
  eq neq lt gt leq geq equivalent approx factorof
  set list union intersect in notin subset prsubset notsubset notprsubset
  setdiff card cartesianproduct
  divergence grad curl laplacian
  naturalnumbers primes integers rationals reals complexes emptyset
  exponentiale imaginaryi notanumber true false pi eulergamma infinity
  vector matrix matrixrow determinant transpose selector
  vectorproduct scalarproduct outerproduct
  mean sdev variance median mode moment momentabout
].freeze

V3_ONLY_IDS = %i[cbytes cerror cs declare share logbase domainofapplication].freeze
V2_EXPECTED_IDS = COMMON_ELEMENT_IDS
V3_EXPECTED_IDS = COMMON_ELEMENT_IDS + V3_ONLY_IDS
V4_EXPECTED_IDS = COMMON_ELEMENT_IDS + %i[declare share logbase domainofapplication]

MML_LIB_FILES = Dir.glob("lib/mml/**/*.rb").freeze
MML_SOURCE_BY_FILE = MML_LIB_FILES.to_h { |f| [f, File.read(f)] }.freeze

# rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations, RSpec/DescribeClass
RSpec.describe "Mml code quality" do
  describe "no internal `require_relative`" do
    it "uses `autoload` instead of require_relative for every lib file" do
      offenders = MML_LIB_FILES.select do |f|
        MML_SOURCE_BY_FILE[f].match?(/^\s*require_relative\s+/)
      end

      expect(offenders).to be_empty,
                           "these files still use require_relative: " \
                           "#{offenders.inspect}"
    end

    it "does not use `require` with an internal path" do
      offenders = MML_LIB_FILES.select do |f|
        # Allow `require "lutaml/model"` and other external gems.
        MML_SOURCE_BY_FILE[f].match?(/^\s*require\s+["']mml\//)
      end

      expect(offenders).to be_empty,
                           "these files require internal mml/ paths: " \
                           "#{offenders.inspect}"
    end
  end

  describe "no encapsulation-bypassing patterns" do
    %w[respond_to? instance_variable_set instance_variable_get].each do |pattern|
      it "does not use `#{pattern}` for type checking or private access" do
        offenders = MML_LIB_FILES.select do |f|
          MML_SOURCE_BY_FILE[f].match?(/[^a-zA-Z_]#{Regexp.escape(pattern)}/)
        end

        # The comment in context_options.rb mentions `respond_to?` to explain
        # why we don't use it. That's documentation, not usage.
        documented_exceptions =
          case pattern
          when "respond_to?"
            ["lib/mml/context_options.rb"]
          else
            []
          end
        real_offenders = offenders - documented_exceptions

        expect(real_offenders).to be_empty,
                                  "these files use `#{pattern}`: " \
                                  "#{real_offenders.inspect}"
      end
    end

    it "does not use `.send(` to bypass visibility (use public_send)" do
      offenders = MML_LIB_FILES.select do |f|
        # Match `.send(` but not `.public_send(`. Backtick-safe regex.
        MML_SOURCE_BY_FILE[f].match?(/[a-zA-Z0-9_)\]]\s*\.send\(/)
      end

      expect(offenders).to be_empty,
                           "these files use `.send(`: #{offenders.inspect}"
    end
  end

  describe "no hand-rolled serialization" do
    %w[to_h from_h to_hash from_hash serialize deserialize].each do |method|
      it "does not define `#{method}` on a model class" do
        offenders = MML_LIB_FILES.select do |f|
          MML_SOURCE_BY_FILE[f].match?(/^\s*def\s+#{method}\b/)
        end

        expect(offenders).to be_empty,
                             "these files define `def #{method}`: " \
                             "#{offenders.inspect}"
      end
    end
  end

  describe "every per-element class is registered in its version context" do
    def expect_registered(version, expected_ids)
      ctx = Lutaml::Model::GlobalContext.context(version::Configuration.context_id)
      registered = ctx.registry.names.to_set
      missing = expected_ids.reject { |id| registered.include?(id) }

      expect(missing).to be_empty,
                         "#{version} is missing registrations for: " \
                         "#{missing.inspect}"
    end

    it "registers all expected element IDs in Mml::V2 context" do
      expect_registered(Mml::V2, V2_EXPECTED_IDS)
    end

    it "registers all expected element IDs in Mml::V3 context" do
      expect_registered(Mml::V3, V3_EXPECTED_IDS)
    end

    it "registers all expected element IDs in Mml::V4 context" do
      expect_registered(Mml::V4, V4_EXPECTED_IDS)
    end
  end

  describe "every autoload constant resolves" do
    # Walks the autoload table by referencing each top-level constant the
    # version modules expose. If a const is missing, NameError fires.
    it "resolves every Mml::V2 autoloaded class" do
      expect { Mml::V2.constants.each { |c| Mml::V2.const_get(c) } }
        .not_to raise_error
    end

    it "resolves every Mml::V3 autoloaded class" do
      expect { Mml::V3.constants.each { |c| Mml::V3.const_get(c) } }
        .not_to raise_error
    end

    it "resolves every Mml::V4 autoloaded class" do
      expect { Mml::V4.constants.each { |c| Mml::V4.const_get(c) } }
        .not_to raise_error
    end
  end

  describe "Mml::ContextOptions.normalize_context_reference" do
    let(:v3_context) do
      Lutaml::Model::GlobalContext.context(Mml::V3::Configuration.context_id)
    end

    it "passes Symbol through unchanged" do
      expect(Mml::ContextOptions.normalize_context_reference(:mml_v3)).to eq(:mml_v3)
    end

    it "casts String to Symbol" do
      expect(Mml::ContextOptions.normalize_context_reference("mml_v3")).to eq(:mml_v3)
    end

    it "returns nil for nil" do
      expect(Mml::ContextOptions.normalize_context_reference(nil)).to be_nil
    end

    it "extracts id from a Lutaml::Model::TypeContext instance" do
      expect(Mml::ContextOptions.normalize_context_reference(v3_context))
        .to eq(Mml::V3::Configuration.context_id)
    end

    it "extracts id from a Lutaml::Model::Register instance" do
      register = Lutaml::Model::Register.new(:custom_register_for_spec)
      expect(Mml::ContextOptions.normalize_context_reference(register))
        .to eq(:custom_register_for_spec)
    end

    it "raises ArgumentError for unsupported types" do
      expect { Mml::ContextOptions.normalize_context_reference(42) }
        .to raise_error(ArgumentError, /Unsupported context\/register reference/)
    end
  end
end
# rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations, RSpec/DescribeClass
