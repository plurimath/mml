# TODO 2 — Migrate `lib/mml/v2.rb` from `require_relative` to `autoload`

## Why
Same as TODO 1 but for V2. Mirror the V4 pattern.

## Scope
- Replace every `require_relative "v2/..."` with `autoload :Klass, "mml/v2/..."`.
- Grouped files have multiple classes per file.

## Class → file map (V2)
### One-class files (presentation + content)
Same shape as V3 but in `v2/` directory: Maction, Maligngroup, Malignmark,
Menclose, Merror, Mfenced, Mfrac, Mfraction, Mglyph, Mi, Mlabeledtr, Mlongdiv,
Mmultiscripts, Mn, Mo, Mover, Mpadded, Mphantom, Mprescripts, Mroot, Mrow,
Ms, Mscarries, Mscarry, Msgroup, Msline, Mspace, Msqrt, Msrow, Mstack,
Mstyle, Msub, Msubsup, Msup, Mtable, Mtd, Mtext, Mtr, Munder, Munderover,
None, Semantics, Math, Annotation, AnnotationXml, Apply, Bvar, Bind, Ci,
Cn, Condition, Csymbol, Degree, Fn, Interval, Inverse, Lambda, Otherwise,
Piece, Piecewise, Reln, Sep

### Grouped files
- `v2/arith.rb` → Abs, Conjugate, Arg, Real, Imaginary, Floor, Ceiling,
  Quotient, Divide, Rem, Minus, Plus, Times, Power, Root, Max, Min, Gcd, Lcm,
  Sum, Product, Factorial
- `v2/calculus.rb` → Int, Diff, Partialdiff, Limit, Lowlimit, Uplimit, Tendsto
- `v2/constants.rb` → Naturalnumbers, Primes, Integers, Rationals, Reals,
  Complexes, Emptyset, Exponentiale, Imaginaryi, Pi, Eulergamma, Mtrue,
  Mfalse, Infinity, Notanumber
- `v2/elementary_functions.rb` → Exp, Ln, Log, Logbase, Sin, Cos, Tan, Sec,
  Csc, Cot, Arcsin, Arccos, Arctan, Arccot, Arccsc, Arcsec, Sinh, Cosh, Tanh,
  Sech, Csch, Coth, Arcsinh, Arccosh, Arctanh, Arccoth, Arccsch, Arcsech
- `v2/functions.rb` → Compose, Domain, Codomain, Image, Ident,
  Domainofapplication
- `v2/linear_algebra.rb` → Vector, Matrix, Matrixrow, Determinant, Transpose,
  Selector, Vectorproduct, Scalarproduct, Outerproduct
- `v2/logic.rb` → And, Or, Xor, Not, Exists, Forall, Implies
- `v2/relations.rb` → Eq, Neq, Leq, Lt, Geq, Gt, Equivalent, Approx, Factorof
- `v2/sets.rb` → Set, Mlist, Union, Intersect, In, Notin, Subset, Prsubset,
  Notsubset, Notprsubset, Setdiff, Card, Cartesianproduct
- `v2/statistics.rb` → Mean, Sdev, Variance, Median, Mode, Moment, Momentabout
- `v2/vector_calculus.rb` → Divergence, Grad, Curl, Laplacian

## Acceptance
- `grep -rn "require_relative" lib/mml/v2.rb` returns nothing.
- `bundle exec rspec` passes.
- `bundle exec rubocop lib/mml/v2.rb` clean.
