# TODO: `lspace`/`rspace` on non-mo token elements (data fidelity, NOT spec)

## Severity: Low (data fidelity enhancement, not a spec compliance bug)

## Problem

Real-world MathML documents sometimes use `lspace` or `rspace` on non-`<mo>` token
elements (e.g., `<mi rspace="thickmathspace">`). The gem silently drops these
attributes during round-trip because they're only implemented on `Mml::Base::Mo`.

The original TODO report (`TODO-mml-missing-rspace.md`) claimed these are valid
on ALL token elements per the MathML spec. This claim is **incorrect**.

## Schema Evidence: `lspace`/`rspace` are `mo`-only across ALL versions

### MathML 2 XSD (`schemas/mathml2/presentation/common-attribs.xsd`)
- `Operator.attrib` (line 57-105): contains `lspace` and `rspace`
- Only `mo.attlist` references `Operator.attrib` (line 46-50)
- `mi.attlist`, `mn.attlist`, `mtext.attlist`, `ms.attlist` do NOT reference it

### MathML 3 XSD (`schemas/mathml3/mathml3-presentation.xsd`)
- `mo.attributes` (line 203-204): `lspace`, `rspace` directly on mo
- `mi.attributes` (line 152-156): only CommonAtt + CommonPresAtt + TokenAtt — no lspace/rspace
- `mn.attributes` (line 163-167): same
- `mtext.attributes` (line 346-350): same
- `ms.attributes` (line 441-447): same + lquote/rquote

### MathML 4 Core RNC (`schemas/mathml4/mathml4-core.rnc`)
- `mo.attributes` (line 228-229): `attribute lspace`, `attribute rspace`
- `mi.attributes` (line 217-218): only MathMLPGlobalAttributes
- `mn.attributes` (line 220-222): only MathMLPGlobalAttributes
- `mtext.attributes` (line 238-240): only MathMLPGlobalAttributes
- `ms.attributes` (line 249-251): only MathMLPGlobalAttributes

## Conclusion

The TODO report's claim that `lspace`/`rspace` are defined on a "TokenEl type" and
apply to all token elements is fabricated. No such type exists in any schema version.
These are `mo`-specific operator spacing attributes, always have been.

## Real-World Impact

196 normative diffs in the Metanorma round-trip test suite — documents use
`<mi rspace="thickmathspace">` in practice. Even though the spec doesn't mandate
supporting this, the gem should preserve the attribute to prevent data loss.

## Recommended Fix (Optional Enhancement)

If round-trip fidelity for these non-standard uses is desired, add `lspace` and
`rspace` to the non-mo token elements. This should be documented as a data
fidelity enhancement, not a spec compliance fix.

```ruby
# Add to Mml::Base::Mi, Mml::Base::Mn, Mml::Base::Mtext, Mml::Base::Ms
attribute :lspace, :string
attribute :rspace, :string

# In xml do...end block:
map_attribute "lspace", to: :lspace
map_attribute "rspace", to: :rspace
```

## Test Case

```xml
<math xmlns="http://www.w3.org/1998/Math/MathML">
  <mrow>
    <mstyle mathvariant="normal"><mi>µmol</mi></mstyle>
    <mi rspace="thickmathspace">⁢</mi>
    <msup><mstyle mathvariant="normal"><mi>mol</mi></mstyle>
      <mrow><mo>−</mo><mn>1</mn></mrow>
    </msup>
  </mrow>
</math>
```

The `<mi rspace="thickmathspace">` currently loses its `rspace` during round-trip.
This is a data fidelity issue, NOT a spec violation — the input document is the one
not complying with the spec.
