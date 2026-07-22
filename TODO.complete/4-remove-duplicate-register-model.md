# TODO 4 — Remove duplicate per-element `Configuration.register_model` (DRY/SSOT)

## Why
After TODO 1 & 2, V2 and V3 will mirror V4's pattern of `autoload + module-body
register_model`. The per-element files (`lib/mml/v{2,3}/<tag>.rb`) currently
also end with `Configuration.register_model(Klass, id: :tag)`. That is
duplicate work — `register_model` overwrites the same key with the same class.

V4 is inconsistent: most files omit the per-element call, but `annotation.rb`,
`elementary_functions.rb`, and `functions.rb` still have it.

Single source of truth: the version module body (`lib/mml/v{2,3,4}.rb`).

## Scope
- Remove the trailing `Configuration.register_model(...)` line from every
  per-element file under `lib/mml/v2/`, `lib/mml/v3/`, `lib/mml/v4/`.
- Do NOT touch `lib/mml/v{2,3,4}.rb` (module-body registrations stay).

## Files affected
- V3: 66 per-element files (every file under `lib/mml/v3/` except
  `configuration.rb`, `namespace.rb`, `common_elements.rb`, `version.rb`).
- V2: ~62 per-element files.
- V4: 3 files — `annotation.rb`, `elementary_functions.rb`, `functions.rb`.

## Acceptance
- `grep -rn "Configuration.register_model" lib/mml/v2 lib/mml/v3 lib/mml/v4 |
  grep -v "v[234]\.rb:"` returns nothing (only version module files have it).
- `bundle exec rspec` passes.
- `bundle exec rubocop lib/` clean.
- Registration spec (TODO 7) confirms all element IDs are still registered
  in their respective contexts.
