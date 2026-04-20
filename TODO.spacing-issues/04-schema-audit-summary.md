# Schema Audit Summary: Token Element Attributes

## Audit Scope

Systematic comparison of token element attributes across:
- MathML 2 XSD (`schemas/mathml2/`)
- MathML 3 XSD (`schemas/mathml3/`)
- MathML 4 Core + Presentation RNC (`schemas/mathml4/`)
- mml gem implementation (`lib/mml/base/`, `lib/mml/v3/`, `lib/mml/v4/`)

## Attribute Origin by Schema Version

### V3 Token Element Attribute Composition

| Attribute Group | Attributes | Used by |
|----------------|-----------|---------|
| `CommonAtt` | id, xref, class, style, href | ALL elements |
| `CommonPresAtt` | mathcolor, mathbackground | ALL pres elements |
| `TokenAtt` | mathvariant, mathsize, dir | mi, mn, mo, mtext, ms |
| `DeprecatedTokenAtt` | fontfamily, fontweight, fontstyle, fontsize, color, background | tokens (V3 only) |
| mo-specific | form, fence, separator, lspace, rspace, stretchy, symmetric, maxsize, minsize, largeop, movablelimits, accent, linebreak*, indent* | mo only |
| ms-specific | lquote, rquote | ms only |

### V4 Token Element Attribute Composition

| Attribute Group | Attributes | Used by |
|----------------|-----------|---------|
| `MathMLPGlobalAttributes` | id, class, style, dir, mathcolor, mathbackground, mathsize, mathvariant, displaystyle, scriptlevel, intent, arg | ALL elements |
| mo-specific (core) | form, lspace, rspace, stretchy, symmetric, maxsize, minsize, largeop, movablelimits | mo only |
| mo-specific (pres) | linebreak*, indent*, accent | mo only |
| ms-specific | lquote, rquote | ms only |

## Gem Implementation Matrix

| Attribute | Mi | Mn | Mo | Mtext | Ms | Mspace | Source |
|-----------|----|----|-----|-------|----|--------|--------|
| mathcolor | G | G | G | G | G | B | UniversalPresentationAttributes |
| mathbackground | G | G | G | G | G | B | UniversalPresentationAttributes |
| mathsize | G | G | G | G | G | - | UniversalPresentationAttributes |
| mathvariant | B | B | B | B | B | B | Base::Mi/Mn/Mo/Mtext/Ms |
| displaystyle | G | G | G | G | G | - | UniversalPresentationAttributes |
| scriptlevel | G | G | G | G | G | - | UniversalPresentationAttributes |
| **dir** | **G** | **G** | **G** | **G** | **G** | **B** | **V3Common (UNMAPPED!)** |
| intent | V4 | V4 | V4 | V4 | V4 | - | V4OnlyAttributes |
| arg | V4 | V4 | V4 | V4 | V4 | - | V4OnlyAttributes |
| form | - | - | B | - | - | - | Base::Mo |
| lspace | - | - | B | - | - | - | Base::Mo |
| rspace | - | - | B | - | - | - | Base::Mo |
| stretchy | - | - | B | - | - | - | Base::Mo |
| symmetric | - | - | B | - | - | - | Base::Mo |
| maxsize | - | - | B | - | - | - | Base::Mo |
| minsize | - | - | B | - | - | - | Base::Mo |
| largeop | - | - | B | - | - | - | Base::Mo |
| movablelimits | - | - | B | - | - | - | Base::Mo |
| accent | - | - | B | - | - | - | Base::Mo |
| fence | - | - | V3O | - | - | - | V3Only::OperatorAttributes |
| separator | - | - | V3O | - | - | - | V3Only::OperatorAttributes |
| linebreak* | - | - | B | - | - | B | Base::Mo / Base::Mspace |
| indent* | - | - | B | - | - | B | Base::Mo / Base::Mspace |
| lquote | - | - | - | - | B | - | Base::Ms |
| rquote | - | - | - | - | B | - | Base::Ms |
| Deprecated font | V3 | V3 | V3 | V3 | V3 | - | DeprecatedFontAttributes |

**G** = from gem global modules, **B** = from base module, **V3O** = V3-only module, **V4** = V4-only

Legend: G=UniversalPresentationAttributes/V3Common, B=Base::*, V3O=V3Only, V4=V4Only

## Issues Found

1. **`dir` unmapped** (see `01-dir-unmapped-v3common.md`) — HIGH
2. **`rspace` missing from mpadded** (see `02-rspace-missing-mpadded-v4.md`) — MEDIUM
3. **`lspace`/`rspace` on non-mo tokens** (see `03-lspace-rspace-non-mo-tokens.md`) — LOW

## What Was Already Correct

- `separator` on mo: correctly in `V3Only::OperatorAttributes`, only for V2/V3
- `fence` on mo: same module, same scoping
- Deprecated font attributes: correctly scoped to V3 only via `DeprecatedFontAttributes`
- `mspace` dir: correctly has both attribute + mapping independently
- All `mo`-specific attributes (form, stretchy, etc.) correctly scoped to Base::Mo only
