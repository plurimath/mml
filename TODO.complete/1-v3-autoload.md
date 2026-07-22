# TODO 1 — Migrate `lib/mml/v3.rb` from `require_relative` to `autoload`

## Why
Global rule: never use `require_relative` for code inside our own library.
Use Ruby `autoload` declared in the immediate parent namespace's file
(`lib/mml/v3.rb`). `lib/mml/v4.rb` already follows this pattern; V3 should
match it for consistency (MECE/SSOT).

## Scope
- `lib/mml/v3.rb` — replace every `require_relative "v3/..."` with the
  corresponding `autoload :Klass, "mml/v3/..."`.
- Grouped files (e.g. `v3/arith.rb`) contain multiple classes — emit one
  `autoload` line per class, all pointing at the same file path.
- Keep the existing `Configuration.register_model(...)` calls in the module
  body — they trigger autoload on first reference and preserve eager
  registration behavior.
- Foundational files (`configuration`, `namespace`, `common_elements`) also
  switch to `autoload`.

## Class → file map (V3)
### One-class files (presentation)
Maction, Maligngroup, Malignmark, Menclose, Merror, Mfenced, Mfrac,
Mfraction, Mglyph, Mi, Mlabeledtr, Mlongdiv, Mmultiscripts, Mn, Mo, Mover,
Mpadded, Mphantom, Mprescripts, Mroot, Mrow, Ms, Mscarries, Mscarry,
Msgroup, Msline, Mspace, Msqrt, Msrow, Mstack, Mstyle, Msub, Msubsup, Msup,
Mtable, Mtd, Mtext, Mtr, Munder, Munderover, None, Semantics, Math

### One-class files (content)
Apply, Cbytes, Cerror, Cs, Ci, Cn, Csymbol, AnnotationXml, Annotation,
Bind, Bvar, Condition, Degree, Interval, Inverse, Lambda, Otherwise, Piece,
Piecewise, Reln, Sep, Fn, Declare, Share

### Grouped files (multiple classes per file)
- `v3/arith.rb` → Abs, Conjugate, Arg, Real, Imaginary, Floor, Ceiling,
  Quotient, Divide, Rem, Minus, Plus, Times, Power, Root, Max, Min, Gcd, Lcm,
  Sum, Product, Factorial
- `v3/calculus.rb` → Int, Diff, Partialdiff, Limit, Lowlimit, Uplimit, Tendsto
- `v3/constants.rb` → Naturalnumbers, Primes, Integers, Rationals, Reals,
  Complexes, Emptyset, Exponentiale, Imaginaryi, Pi, Eulergamma, Mtrue,
  Mfalse, Infinity, Notanumber
- `v3/elementary_functions.rb` → Exp, Ln, Log, Logbase, Sin, Cos, Tan, Sec,
  Csc, Cot, Arcsin, Arccos, Arctan, Arccot, Arccsc, Arcsec, Sinh, Cosh, Tanh,
  Sech, Csch, Coth, Arcsinh, Arccosh, Arctanh, Arccoth, Arccsch, Arcsech
- `v3/functions.rb` → Compose, Domain, Codomain, Image, Ident,
  Domainofapplication
- `v3/linear_algebra.rb` → Vector, Matrix, Matrixrow, Determinant, Transpose,
  Selector, Vectorproduct, Scalarproduct, Outerproduct
- `v3/logic.rb` → And, Or, Xor, Not, Exists, Forall, Implies
- `v3/relations.rb` → Eq, Neq, Leq, Lt, Geq, Gt, Equivalent, Approx, Factorof
- `v3/sets.rb` → Set, Mlist, Union, Intersect, In, Notin, Subset, Prsubset,
  Notsubset, Notprsubset, Setdiff, Card, Cartesianproduct
- `v3/statistics.rb` → Mean, Sdev, Variance, Median, Mode, Moment, Momentabout
- `v3/vector_calculus.rb` → Divergence, Grad, Curl, Laplacian
- `v3/constructs.rb` → Bvar, Condition, Interval, Lambda, Inverse, Degree,
  Piecewise, Piece, Otherwise, Sep
- `v3/deprecated_content.rb` → Fn, Reln, Declare, Share

## Acceptance
- `grep -rn "require_relative" lib/mml/v3.rb` returns nothing.
- `bundle exec rspec` passes (2940+ examples, 36 pre-existing pending).
- `bundle exec rubocop lib/mml/v3.rb` clean.
- All `Mml::V3::*` constants remain accessible and registered after
  `require "mml"`.
