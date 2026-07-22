# TODO 7 — Add specs covering the refactorings

## Why
Lock in the behavior of the refactorings in TODOs 1–6 so future regressions
are caught. MECE with existing specs:
- `spec/mml/adapter_configuration_spec.rb` — adapter selection
- `spec/mml/ordered_content_spec.rb` — mixed_content vs ordered
- `spec/mml/nested_in_mixed_content_spec.rb` — entity preservation in host
- `spec/lutaml_default_register_spec.rb` — every Serializable class has
  `lutaml_default_register`
- `spec/context_support_spec.rb` — context creation/substitution

None of these cover:
- `ContextOptions.normalize_context_reference` for `TypeContext`/`Register`
  inputs.
- Lint: no `require_relative` in `lib/mml/**/*.rb`.
- Lint: no `respond_to?` in `lib/mml/**/*.rb`.
- Lint: no `.send(` / `instance_variable_set` / `instance_variable_get` in
  `lib/mml/**/*.rb`.
- Smoke: every `Mml::V{2,3,4}` autoload constant resolves and is registered
  after `require "mml"`.

## Scope
Create `spec/mml/code_quality_spec.rb` covering all four lint checks plus a
smoke test that iterates the Configuration register and asserts every
expected element ID is present for V2, V3, V4.

Update `spec/context_support_spec.rb` (or add a new spec) to cover
`ContextOptions.normalize_context_reference` with `TypeContext` and `Register`
inputs — these now flow through the new `is_a?` branches.

## Acceptance
- New spec file(s) added.
- `bundle exec rspec` passes.
- `bundle exec rubocop` clean.
- Removing any autoload declaration or per-element class breaks the smoke
  spec.
- Adding a new `require_relative` to `lib/mml/` breaks the lint spec.
