# TODO 3 — Eliminate remaining `require_relative` in `lib/mml/`

## Why
After TODO 1 & 2, the only remaining `require_relative` calls in `lib/mml/`
are:
- `lib/mml/v2.rb:4`  — `require_relative "versioned_parser"`
- `lib/mml/v3.rb:4`  — `require_relative "versioned_parser"`
- `lib/mml/v4.rb:4`  — `require_relative "versioned_parser"`
- `lib/mml/v{2,3,4}/configuration.rb:3` — `require_relative "../context_configuration"`
- `lib/mml/v{2,3,4}.rb` top — `require_relative "v{2,3,4}/configuration"`,
  `"v{2,3,4}/namespace"`, `"v{2,3,4}/common_elements"` (V4 only today, but if
  V2/V3 also adopt the same pattern during TODO 1/2 they need the same fix).

All of these can be replaced with autoloads declared in `lib/mml.rb` and in
the version module files.

## Scope
1. `lib/mml.rb` — add `autoload :VersionedParser, "mml/versioned_parser"`
   (currently `ContextOptions` and others are autoloaded; `VersionedParser`
   is missing).
2. `lib/mml/v{2,3,4}/configuration.rb` — remove the
   `require_relative "../context_configuration"` line. `Mml::ContextConfiguration`
   is autoloaded from `lib/mml.rb`, so the `extend Mml::ContextConfiguration`
   call resolves correctly.
3. `lib/mml/v{2,3,4}.rb` — replace `require_relative "v{2,3,4}/configuration"`
   and the foundational requires with `autoload` declarations.

## Acceptance
- `grep -rn "require_relative" lib/mml/` returns zero matches.
- `bundle exec rspec` passes.
- `bundle exec rubocop lib/` clean.
- Smoke spec (TODO 7) confirms every `Mml::V{2,3,4}::*` class resolves.
