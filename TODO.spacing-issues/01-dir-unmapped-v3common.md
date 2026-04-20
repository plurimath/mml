# TODO: `dir` attribute declared but not XML-mapped in V3Common

## Severity: High (data loss on round-trip)

## Problem

`V3Common` (`lib/mml/base/v3_common.rb`) declares `attribute :dir, :string` but never
calls `map_attribute "dir", to: :dir` in an `xml do...end` block. The attribute exists
as a Ruby property but is never populated from XML input and never serialized to XML
output. This means `dir="ltr"` or `dir="rtl"` is silently dropped during round-trip.

The only element with a working `dir` mapping is `Mspace` (`lib/mml/base/mspace.rb:33`),
which declares it independently.

## Schema Evidence

All three schemas confirm `dir` is valid on these elements:

### MathML 3 XSD (`schemas/mathml3/mathml3-presentation.xsd`)
- `TokenAtt` attribute group (line 624-631): `dir` on ALL token elements (mi, mn, mo, mtext, ms)
- `mrow.attributes` (line 713-720): `dir` on mrow
- `mstyle.generalattributes` (line 1010-1017): `dir` on mstyle
- `math.attributes` inherits mstyle.generalattributes

### MathML 4 Core RNC (`schemas/mathml4/mathml4-core.rnc`)
- `MathMLPGlobalAttributes` (line 139): `attribute dir {"ltr" | "rtl"}?` — on ALL presentation elements

### MathML 2 XSD (`schemas/mathml2/presentation/common-attribs.xsd`)
- Does NOT have `dir` (added in MathML 3)

## Affected Elements (V3 + V4)

| Element | V3Common included? | dir mapped? |
|---------|-------------------|-------------|
| mi      | yes               | **NO**      |
| mn      | yes               | **NO**      |
| mo      | yes               | **NO**      |
| mtext   | yes               | **NO**      |
| ms      | yes               | **NO**      |
| mrow    | yes               | **NO**      |
| mstyle  | yes               | **NO**      |
| math    | yes               | **NO**      |
| mspace  | no (independent)  | yes         |

## Fix

Add an `xml do...end` block with the `dir` mapping to `V3Common`:

```ruby
# lib/mml/base/v3_common.rb
module Mml
  module Base
    module V3Common
      def self.included(klass)
        klass.class_eval do
          attribute :dir, :string
          include V3PresentationAttributes

          xml do
            namespace Mml::Namespace
            map_attribute "dir", to: :dir
          end
        end
      end
    end
  end
end
```

## Test Case

```xml
<math xmlns="http://www.w3.org/1998/Math/MathML">
  <mrow dir="rtl">
    <mi dir="rtl">x</mi>
    <mo>+</mo>
    <mn>1</mn>
  </mrow>
</math>
```

The `dir` attributes are currently silently dropped during round-trip.
