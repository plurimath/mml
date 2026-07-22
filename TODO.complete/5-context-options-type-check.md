# TODO 5 — Replace `respond_to?(:id)` with explicit type check in `context_options.rb`

## Why
Global rule: never use `respond_to?` for type checking. Use `is_a?` or
design the type hierarchy so the check isn't needed.

`lib/mml/context_options.rb:34` uses `reference.respond_to?(:id)` to duck-type
any object that exposes an `id`. The actual types that can reach this code are:
- `Symbol` — handled earlier
- `String` — handled earlier
- `Lutaml::Model::TypeContext` (lutaml-model) — has `attr_reader :id`
- `Lutaml::Model::Register` (lutaml-model) — has `attr_reader :id`

## Scope
- Replace the `respond_to?` branch with explicit `is_a?` checks against the
  two known lutaml-model classes.
- Keep the `ArgumentError` fallback for unknown types — preserves
  fail-fast behavior.

## Implementation
```ruby
def normalize_context_reference(reference)
  return nil if reference.nil?
  return reference if reference.is_a?(Symbol)
  return reference.to_sym if reference.is_a?(String)
  return reference.id.to_sym if context_reference_object?(reference)

  raise ArgumentError,
        "Unsupported context/register reference: #{reference.inspect}"
end

private

def context_reference_object?(reference)
  reference.is_a?(Lutaml::Model::TypeContext) ||
    reference.is_a?(Lutaml::Model::Register)
end
```

## Acceptance
- `grep -n "respond_to?" lib/mml/context_options.rb` returns nothing.
- `bundle exec rspec spec/mml/context_options_spec.rb` passes (new spec from
  TODO 7).
- Existing parse/configuration specs still pass.
