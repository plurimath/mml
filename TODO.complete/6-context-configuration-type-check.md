# TODO 6 — Replace `respond_to?(:clear_cache)` with explicit type check in `context_configuration.rb`

## Why
Global rule: never use `respond_to?` for type checking.

`lib/mml/context_configuration.rb:144` uses
`klass.clear_cache(context_id) if klass.respond_to?(:clear_cache)`.

Every class registered via `Configuration.register_model` inherits from
`Lutaml::Model::Serializable`, which defines `clear_cache` as a class method
(see lutaml-model `lib/lutaml/model/serialize/initialization.rb:180`).

## Scope
- Replace the `respond_to?` guard with an explicit type check:
  `klass.is_a?(Class) && klass <= Lutaml::Model::Serialize`.
- Note the use of `<=` (subclass-or-equal) rather than `<` so that
  `Serializable` itself would also qualify, matching the intent of "any class
  in the Serializable hierarchy".

## Implementation
```ruby
def clear_cache(klass)
  return unless klass.is_a?(Class) && (klass <= Lutaml::Model::Serialize)

  klass.clear_cache(context_id)
end
```

## Acceptance
- `grep -n "respond_to?" lib/mml/context_configuration.rb` returns nothing.
- `bundle exec rspec` passes.
- `bundle exec rubocop lib/mml/context_configuration.rb` clean.
