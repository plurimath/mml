# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`mml` is a Ruby gem that provides MathML 2, MathML 3, and MathML 4 XML parsing and serialization. It maps MathML elements into Ruby model classes using the `lutaml-model` framework. Part of the [Plurimath](https://github.com/plurimath/mml) ecosystem.

## Commands

```bash
rake                                # Run specs + rubocop (default task)
bundle exec rspec                   # Run all tests
bundle exec rspec spec/mml/v3/msub_spec.rb:14  # Run single test by line
bundle exec rspec --only-failures   # Previously failing tests only
bundle exec rubocop                 # Lint
bundle exec rubocop -a              # Auto-fix lint issues
bin/console                         # IRB with gem loaded
```

## Versioned Architecture

The gem maintains **three** separate class hierarchies: `Mml::V2::` (MathML 2), `Mml::V3::` (MathML 3), and `Mml::V4::` (MathML 4). Users must reference the versioned namespace explicitly — no backward-compat aliases.

```ruby
Mml.parse(input)                # Default: MathML 3
Mml.parse(input, version: 2)   # MathML 2
Mml.parse(input, version: 3)   # Explicit MathML 3
Mml.parse(input, version: 4)   # MathML 4 with intent/arg attributes
```

**Directory structure:**
- `lib/mml/base/` — version-agnostic element modules, mixed into each version's class via `include Base::XYZ`. The single source of truth for the XML mapping DSL.
- `lib/mml/v2/`, `lib/mml/v3/`, `lib/mml/v4/` — per-version class declarations (each ~3 lines: declare class, mix in base module, register).

**Key difference (V3 → V4):** MathML 4 adds `intent`, `arg`, `displaystyle`, and `scriptlevel` as universal presentation attributes for accessibility markup; removes some deprecated attributes.

**No hidden delegation:** The `Mml` module does not alias or delegate constants. Use `Mml::V3::Math`, `Mml::V4::Mi`, etc. directly.

## Entry Points

- `Mml.parse(input, version: N)` — parse XML, returns `Mml::V{2,3,4}::Math` object graph
- `Mml::V3.parse(input)` / `Mml::V4.parse(input)` — version-specific parsing
- `Mml::V4::Math.from_xml(input)` — directly parse with v4 classes
- Call `to_xml` on any element to serialize back

## Element Mapping Pattern

Each MathML element is a `Lutaml::Model::Serializable` subclass with an `xml do...end` DSL block. The XML mapping lives in `lib/mml/base/<tag>.rb` as a module included into each version's class (e.g., `Mml::V3::Msub` includes `Mml::Base::Msub`).

### Content model — `mixed_content` vs `ordered` vs `map_content`

This is the most important decision when adding or editing an element. Pick based on the **schema** (see `schemas/mathml3/`, `schemas/mathml4/`, `reference-docs/mathml-source/`):

| Schema content model                              | Use                                  | Examples                       |
|---------------------------------------------------|--------------------------------------|--------------------------------|
| True mixed `(#PCDATA \| mglyph \| malignmark)*`   | `mixed_content` + `map_content`      | `Mi`, `Mn`, `Mo`, `Ms`, `Mtext`|
| Element-only (`ImpliedMrow`, `<xs:sequence>`, etc.) | `ordered`                          | `Msub`, `Mfrac`, `Mrow`, `Math`, `Munder`, `Mfenced`, `Msgroup`, … |

**Why this matters:** lutaml-model's `each_mixed_content` iteration exposes all children to consumers (Plurimath's translator does positional indexing like `children[0]`, `children[1]` for `msub`/`mfrac`/etc.).
- Under `mixed_content`, whitespace between elements is yielded as a String child, shifting positional indices.
- Under `ordered`, whitespace-only text nodes are skipped — only elements and non-whitespace text are yielded.

If you mistakenly use `mixed_content` on an element-only schema element, downstream consumers see phantom whitespace children and silently misinterpret the tree (e.g., render `<msub><mi>t</mi><mn>90</mn></msub>` with whitespace between children as base=whitespace, sub=`<mi>t</mi>`, dropping `<mn>90</mn>`).

**Verification workflow for any element edit:**
```bash
grep -A15 'name="<tag>"' schemas/mathml3/mathml3-presentation.xsd schemas/mathml3/mathml3-common.xsd
grep -A3 '<tag>\s*=\s*element' schemas/mathml4/mathml4-core.rnc schemas/mathml4/mathml4-presentation.rnc
```

If the schema says `ImpliedMrow`, `MathExpression, MathExpression`, `MstackExpression*`, `TableRowExpression*`, etc. (any element-only sequence), use `ordered`. If it says `(#PCDATA | mglyph | malignmark)*`, use `mixed_content` + `map_content` + `map_element` for the inline children.

### Token elements are the only true mixed content

Per MathML schema, token elements (`mi`, `mn`, `mo`, `ms`, `mtext`) accept `(#PCDATA | mglyph | malignmark)*` — text interleaved with inline elements. They use:

```ruby
attribute :value, :string, collection: true           # collection required for mixed_content
attribute :mglyph_value, :mglyph, collection: true
attribute :malignmark_value, :malignmark, collection: true

xml do
  element "<tag>"
  mixed_content
  map_content to: :value
  map_element "mglyph", to: :mglyph_value
  map_element "malignmark", to: :malignmark_value
end
```

`value` is a `String` **collection** (Array) because text can be split by intervening inline elements (e.g., `<mi>x<malignmark/>y</mi>` → `["x", "y"]`).

### CommonAttributes

A `no_root` Lutaml model imported into container elements via `import_model`. It dynamically creates `#{tag}_value` attributes for each tag in `Configuration::SUPPORTED_TAGS`. Classes that receive it are listed in `Configuration::COMMON_ATTRIBUTES_CLASSES`.

### Per-file registration

Each `lib/mml/v{2,3,4}/<tag>.rb` ends with `Configuration.register_model(Klass, id: :tag)` so the type is registered as soon as the file is loaded (eager via `require_relative` at the bottom of each version file).

**Namespace:** All versions use the same URI (`http://www.w3.org/1998/Math/MathML`) — MathML 4 chose backward compatibility over a new namespace.

## Adapter

`Mml.default_adapter` returns `:oga` under Opal, otherwise delegates to `Lutaml::Model::Config.xml_adapter_type` (defaults to `:nokogiri`). Specs pin `:nokogiri` in `spec_helper.rb`. Users can override globally via `Lutaml::Model::Config`.

## Spec Structure

- `spec/mml/v2/`, `spec/mml/v3/`, `spec/mml/v4/` — per-version element specs (round-trip + attribute preservation)
- `spec/mml/v3_spec.rb`, `spec/mml/v4_spec.rb` — whole-testsuite round-trip tests against `spec/fixtures/mml3-testsuite/` and `spec/fixtures/mmlcore-testsuite/`
- `spec/mml/ordered_content_spec.rb` — regression specs locking in the mixed_content vs ordered distinction (whitespace handling + token element inline children)
- `spec/mml/adapter_configuration_spec.rb` — adapter delegation
- `spec/context_support_spec.rb`, `spec/lutaml_default_register_spec.rb` — registry/context behavior
- `spec/fixtures/mml2-testsuite/`, `mml3-testsuite/`, `mmlcore-testsuite/` — W3C test suites (submodules)
- `spec/fixtures/v2/`, `v4/` — version-specific fixtures

Specs use `canon`'s `be_xml_equivalent_to` matcher with the `:spec_friendly` profile (whitespace-tolerant). When adding a regression spec for an ordering bug, **explicitly test the inter-element-whitespace scenario** — the suite's whitespace tolerance masks positional bugs.

## Key Dependencies

- `lutaml-model` (~> 0.8.0) — data mapper framework; all element classes inherit from `Lutaml::Model::Serializable`
- `moxml` — XML parsing backbone (adapter selected via `Lutaml::Model::Config`)
- `canon` — XML comparison for specs

## Conventions

- `frozen_string_literal: true` in all files
- RuboCop targets Ruby 3.0; inherits from Ribose OSS guides
- CI workflows are auto-generated by Cimas — do not edit manually
- `Gemfile.lock` is gitignored; dependencies come from the gemspec
- Type signatures exist in `sig/mml.rbs`

## Reference Materials

- `schemas/mathml2/`, `schemas/mathml3/`, `schemas/mathml4/` — official W3C schemas (XSD for 2/3, RelaxNG for 4). **Authoritative** source for content models and attribute lists.
- `reference-docs/mathml-source/` — W3C spec source XML (presentation-markup.xml, validation-grammar.xml, etc.)

When deciding whether an element should have `mixed_content`, `ordered`, or `map_content`, **always** verify against the schema first.
