# frozen_string_literal: true

require "lutaml/model"

module Mml
  module V3
    extend Mml::VersionedParser

    # Foundational
    autoload :Configuration,   "mml/v3/configuration"
    autoload :Namespace,       "mml/v3/namespace"
    autoload :CommonElements,  "mml/v3/common_elements"

    # Presentation elements (one class per file)
    autoload :Maction,       "mml/v3/maction"
    autoload :Maligngroup,   "mml/v3/maligngroup"
    autoload :Malignmark,    "mml/v3/malignmark"
    autoload :Menclose,      "mml/v3/menclose"
    autoload :Merror,        "mml/v3/merror"
    autoload :Mfenced,       "mml/v3/mfenced"
    autoload :Mfrac,         "mml/v3/mfrac"
    autoload :Mfraction,     "mml/v3/mfraction"
    autoload :Mglyph,        "mml/v3/mglyph"
    autoload :Mi,            "mml/v3/mi"
    autoload :Mlabeledtr,    "mml/v3/mlabeledtr"
    autoload :Mlongdiv,      "mml/v3/mlongdiv"
    autoload :Mmultiscripts, "mml/v3/mmultiscripts"
    autoload :Mn,            "mml/v3/mn"
    autoload :Mo,            "mml/v3/mo"
    autoload :Mover,         "mml/v3/mover"
    autoload :Mpadded,       "mml/v3/mpadded"
    autoload :Mphantom,      "mml/v3/mphantom"
    autoload :Mprescripts,   "mml/v3/mprescripts"
    autoload :Mroot,         "mml/v3/mroot"
    autoload :Mrow,          "mml/v3/mrow"
    autoload :Ms,            "mml/v3/ms"
    autoload :Mscarries,     "mml/v3/mscarries"
    autoload :Mscarry,       "mml/v3/mscarry"
    autoload :Msgroup,       "mml/v3/msgroup"
    autoload :Msline,        "mml/v3/msline"
    autoload :Mspace,        "mml/v3/mspace"
    autoload :Msqrt,         "mml/v3/msqrt"
    autoload :Msrow,         "mml/v3/msrow"
    autoload :Mstack,        "mml/v3/mstack"
    autoload :Mstyle,        "mml/v3/mstyle"
    autoload :Msub,          "mml/v3/msub"
    autoload :Msubsup,       "mml/v3/msubsup"
    autoload :Msup,          "mml/v3/msup"
    autoload :Mtable,        "mml/v3/mtable"
    autoload :Mtd,           "mml/v3/mtd"
    autoload :Mtext,         "mml/v3/mtext"
    autoload :Mtr,           "mml/v3/mtr"
    autoload :Munder,        "mml/v3/munder"
    autoload :Munderover,    "mml/v3/munderover"
    autoload :None,          "mml/v3/none"
    autoload :Semantics,     "mml/v3/semantics"
    autoload :Math,          "mml/v3/math"

    # Content elements - one class per file
    autoload :AnnotationXml, "mml/v3/annotation_xml"
    autoload :Annotation,    "mml/v3/annotation"
    autoload :Apply,         "mml/v3/apply"
    autoload :Bind,          "mml/v3/bind"
    autoload :Ci,            "mml/v3/ci"
    autoload :Cn,            "mml/v3/cn"
    autoload :Csymbol,       "mml/v3/csymbol"
    autoload :Cbytes,        "mml/v3/cbytes"
    autoload :Cerror,        "mml/v3/cerror"
    autoload :Cs,            "mml/v3/cs"

    # Content elements - batch files (multiple classes per file).
    # Each autoload points to the shared file; the file is loaded once.
    # arith.rb
    autoload :Abs,         "mml/v3/arith"
    autoload :Conjugate,   "mml/v3/arith"
    autoload :Arg,         "mml/v3/arith"
    autoload :Real,        "mml/v3/arith"
    autoload :Imaginary,   "mml/v3/arith"
    autoload :Floor,       "mml/v3/arith"
    autoload :Ceiling,     "mml/v3/arith"
    autoload :Quotient,    "mml/v3/arith"
    autoload :Divide,      "mml/v3/arith"
    autoload :Rem,         "mml/v3/arith"
    autoload :Minus,       "mml/v3/arith"
    autoload :Plus,        "mml/v3/arith"
    autoload :Times,       "mml/v3/arith"
    autoload :Power,       "mml/v3/arith"
    autoload :Root,        "mml/v3/arith"
    autoload :Max,         "mml/v3/arith"
    autoload :Min,         "mml/v3/arith"
    autoload :Gcd,         "mml/v3/arith"
    autoload :Lcm,         "mml/v3/arith"
    autoload :Sum,         "mml/v3/arith"
    autoload :Product,     "mml/v3/arith"
    autoload :Factorial,   "mml/v3/arith"

    # calculus.rb
    autoload :Int,         "mml/v3/calculus"
    autoload :Diff,        "mml/v3/calculus"
    autoload :Partialdiff, "mml/v3/calculus"
    autoload :Limit,       "mml/v3/calculus"
    autoload :Lowlimit,    "mml/v3/calculus"
    autoload :Uplimit,     "mml/v3/calculus"
    autoload :Tendsto,     "mml/v3/calculus"

    # constants.rb
    autoload :Naturalnumbers, "mml/v3/constants"
    autoload :Primes,         "mml/v3/constants"
    autoload :Integers,       "mml/v3/constants"
    autoload :Rationals,      "mml/v3/constants"
    autoload :Reals,          "mml/v3/constants"
    autoload :Complexes,      "mml/v3/constants"
    autoload :Emptyset,       "mml/v3/constants"
    autoload :Exponentiale,   "mml/v3/constants"
    autoload :Imaginaryi,     "mml/v3/constants"
    autoload :Pi,             "mml/v3/constants"
    autoload :Eulergamma,     "mml/v3/constants"
    autoload :Mtrue,          "mml/v3/constants"
    autoload :Mfalse,         "mml/v3/constants"
    autoload :Infinity,       "mml/v3/constants"
    autoload :Notanumber,     "mml/v3/constants"

    # elementary_functions.rb
    autoload :Exp,      "mml/v3/elementary_functions"
    autoload :Ln,       "mml/v3/elementary_functions"
    autoload :Log,      "mml/v3/elementary_functions"
    autoload :Logbase,  "mml/v3/elementary_functions"
    autoload :Sin,      "mml/v3/elementary_functions"
    autoload :Cos,      "mml/v3/elementary_functions"
    autoload :Tan,      "mml/v3/elementary_functions"
    autoload :Sec,      "mml/v3/elementary_functions"
    autoload :Csc,      "mml/v3/elementary_functions"
    autoload :Cot,      "mml/v3/elementary_functions"
    autoload :Arcsin,   "mml/v3/elementary_functions"
    autoload :Arccos,   "mml/v3/elementary_functions"
    autoload :Arctan,   "mml/v3/elementary_functions"
    autoload :Arccot,   "mml/v3/elementary_functions"
    autoload :Arccsc,   "mml/v3/elementary_functions"
    autoload :Arcsec,   "mml/v3/elementary_functions"
    autoload :Sinh,     "mml/v3/elementary_functions"
    autoload :Cosh,     "mml/v3/elementary_functions"
    autoload :Tanh,     "mml/v3/elementary_functions"
    autoload :Sech,     "mml/v3/elementary_functions"
    autoload :Csch,     "mml/v3/elementary_functions"
    autoload :Coth,     "mml/v3/elementary_functions"
    autoload :Arcsinh,  "mml/v3/elementary_functions"
    autoload :Arccosh,  "mml/v3/elementary_functions"
    autoload :Arctanh,  "mml/v3/elementary_functions"
    autoload :Arccoth,  "mml/v3/elementary_functions"
    autoload :Arccsch,  "mml/v3/elementary_functions"
    autoload :Arcsech,  "mml/v3/elementary_functions"

    # functions.rb
    autoload :Compose,             "mml/v3/functions"
    autoload :Domain,              "mml/v3/functions"
    autoload :Codomain,            "mml/v3/functions"
    autoload :Image,               "mml/v3/functions"
    autoload :Ident,               "mml/v3/functions"
    autoload :Domainofapplication, "mml/v3/functions"

    # linear_algebra.rb
    autoload :Vector,         "mml/v3/linear_algebra"
    autoload :Matrix,         "mml/v3/linear_algebra"
    autoload :Matrixrow,      "mml/v3/linear_algebra"
    autoload :Determinant,    "mml/v3/linear_algebra"
    autoload :Transpose,      "mml/v3/linear_algebra"
    autoload :Selector,       "mml/v3/linear_algebra"
    autoload :Vectorproduct,  "mml/v3/linear_algebra"
    autoload :Scalarproduct,  "mml/v3/linear_algebra"
    autoload :Outerproduct,   "mml/v3/linear_algebra"

    # logic.rb
    autoload :And,      "mml/v3/logic"
    autoload :Or,       "mml/v3/logic"
    autoload :Xor,      "mml/v3/logic"
    autoload :Not,      "mml/v3/logic"
    autoload :Exists,   "mml/v3/logic"
    autoload :Forall,   "mml/v3/logic"
    autoload :Implies,  "mml/v3/logic"

    # relations.rb
    autoload :Eq,          "mml/v3/relations"
    autoload :Neq,         "mml/v3/relations"
    autoload :Leq,         "mml/v3/relations"
    autoload :Lt,          "mml/v3/relations"
    autoload :Geq,         "mml/v3/relations"
    autoload :Gt,          "mml/v3/relations"
    autoload :Equivalent,  "mml/v3/relations"
    autoload :Approx,      "mml/v3/relations"
    autoload :Factorof,    "mml/v3/relations"

    # sets.rb
    autoload :Set,              "mml/v3/sets"
    autoload :Mlist,            "mml/v3/sets"
    autoload :Union,            "mml/v3/sets"
    autoload :Intersect,        "mml/v3/sets"
    autoload :In,               "mml/v3/sets"
    autoload :Notin,            "mml/v3/sets"
    autoload :Subset,           "mml/v3/sets"
    autoload :Prsubset,         "mml/v3/sets"
    autoload :Notsubset,        "mml/v3/sets"
    autoload :Notprsubset,      "mml/v3/sets"
    autoload :Setdiff,          "mml/v3/sets"
    autoload :Card,             "mml/v3/sets"
    autoload :Cartesianproduct, "mml/v3/sets"

    # statistics.rb
    autoload :Mean,        "mml/v3/statistics"
    autoload :Sdev,        "mml/v3/statistics"
    autoload :Variance,    "mml/v3/statistics"
    autoload :Median,      "mml/v3/statistics"
    autoload :Mode,        "mml/v3/statistics"
    autoload :Moment,      "mml/v3/statistics"
    autoload :Momentabout, "mml/v3/statistics"

    # vector_calculus.rb
    autoload :Divergence, "mml/v3/vector_calculus"
    autoload :Grad,       "mml/v3/vector_calculus"
    autoload :Curl,       "mml/v3/vector_calculus"
    autoload :Laplacian,  "mml/v3/vector_calculus"

    # constructs.rb (all classes in one file)
    autoload :Bvar,       "mml/v3/constructs"
    autoload :Condition,  "mml/v3/constructs"
    autoload :Interval,   "mml/v3/constructs"
    autoload :Lambda,     "mml/v3/constructs"
    autoload :Inverse,    "mml/v3/constructs"
    autoload :Degree,     "mml/v3/constructs"
    autoload :Piecewise,  "mml/v3/constructs"
    autoload :Piece,      "mml/v3/constructs"
    autoload :Otherwise,  "mml/v3/constructs"
    autoload :Sep,        "mml/v3/constructs"

    # deprecated_content.rb (MathML 2 compatibility classes)
    autoload :Fn,         "mml/v3/deprecated_content"
    autoload :Reln,       "mml/v3/deprecated_content"
    autoload :Declare,    "mml/v3/deprecated_content"
    autoload :Share,      "mml/v3/deprecated_content"

    # Presentation element registrations
    Configuration.register_model(Maction,       id: :maction)
    Configuration.register_model(Maligngroup,   id: :maligngroup)
    Configuration.register_model(Malignmark,    id: :malignmark)
    Configuration.register_model(Menclose,      id: :menclose)
    Configuration.register_model(Merror,        id: :merror)
    Configuration.register_model(Mfenced,       id: :mfenced)
    Configuration.register_model(Mfrac,         id: :mfrac)
    Configuration.register_model(Mfraction,     id: :mfraction)
    Configuration.register_model(Mglyph,        id: :mglyph)
    Configuration.register_model(Mi,            id: :mi)
    Configuration.register_model(Mlabeledtr,    id: :mlabeledtr)
    Configuration.register_model(Mlongdiv,      id: :mlongdiv)
    Configuration.register_model(Mmultiscripts, id: :mmultiscripts)
    Configuration.register_model(Mn,            id: :mn)
    Configuration.register_model(Mo,            id: :mo)
    Configuration.register_model(Mover,         id: :mover)
    Configuration.register_model(Mpadded,       id: :mpadded)
    Configuration.register_model(Mphantom,      id: :mphantom)
    Configuration.register_model(Mprescripts,   id: :mprescripts)
    Configuration.register_model(Mroot,         id: :mroot)
    Configuration.register_model(Mrow,          id: :mrow)
    Configuration.register_model(Ms,            id: :ms)
    Configuration.register_model(Mscarries,     id: :mscarries)
    Configuration.register_model(Mscarry,       id: :mscarry)
    Configuration.register_model(Msgroup,       id: :msgroup)
    Configuration.register_model(Msline,        id: :msline)
    Configuration.register_model(Mspace,        id: :mspace)
    Configuration.register_model(Msqrt,         id: :msqrt)
    Configuration.register_model(Msrow,         id: :msrow)
    Configuration.register_model(Mstack,        id: :mstack)
    Configuration.register_model(Mstyle,        id: :mstyle)
    Configuration.register_model(Msub,          id: :msub)
    Configuration.register_model(Msubsup,       id: :msubsup)
    Configuration.register_model(Msup,          id: :msup)
    Configuration.register_model(Mtable,        id: :mtable)
    Configuration.register_model(Mtd,           id: :mtd)
    Configuration.register_model(Mtext,         id: :mtext)
    Configuration.register_model(Mtr,           id: :mtr)
    Configuration.register_model(Munder,        id: :munder)
    Configuration.register_model(Munderover,    id: :munderover)
    Configuration.register_model(None,          id: :none)
    Configuration.register_model(Semantics,     id: :semantics)
    Configuration.register_model(Math,          id: :math)

    # Content element registrations
    Configuration.register_model(Annotation,        id: :annotation)
    Configuration.register_model(AnnotationXml,     id: :"annotation-xml")
    Configuration.register_model(Apply,             id: :apply)
    Configuration.register_model(Bvar,              id: :bvar)
    Configuration.register_model(Bind,              id: :bind)
    Configuration.register_model(Ci,                id: :ci)
    Configuration.register_model(Cn,                id: :cn)
    Configuration.register_model(Condition,         id: :condition)
    Configuration.register_model(Csymbol,           id: :csymbol)
    Configuration.register_model(Degree,            id: :degree)
    Configuration.register_model(Fn,                id: :fn)
    Configuration.register_model(Interval,          id: :interval)
    Configuration.register_model(Inverse,           id: :inverse)
    Configuration.register_model(Lambda,            id: :lambda)
    Configuration.register_model(Otherwise,         id: :otherwise)
    Configuration.register_model(Piece,             id: :piece)
    Configuration.register_model(Piecewise,         id: :piecewise)
    Configuration.register_model(Reln,              id: :reln)
    Configuration.register_model(Sep,               id: :sep)
    Configuration.register_model(Declare,           id: :declare)
    Configuration.register_model(Share,             id: :share)
    Configuration.register_model(Cbytes,            id: :cbytes)
    Configuration.register_model(Cerror,            id: :cerror)
    Configuration.register_model(Cs,                id: :cs)

    # Arith
    Configuration.register_model(Abs,         id: :abs)
    Configuration.register_model(Conjugate,   id: :conjugate)
    Configuration.register_model(Arg,         id: :arg)
    Configuration.register_model(Real,        id: :real)
    Configuration.register_model(Imaginary,   id: :imaginary)
    Configuration.register_model(Floor,       id: :floor)
    Configuration.register_model(Ceiling,     id: :ceiling)
    Configuration.register_model(Quotient,    id: :quotient)
    Configuration.register_model(Divide,      id: :divide)
    Configuration.register_model(Rem,         id: :rem)
    Configuration.register_model(Minus,       id: :minus)
    Configuration.register_model(Plus,        id: :plus)
    Configuration.register_model(Times,       id: :times)
    Configuration.register_model(Power,       id: :power)
    Configuration.register_model(Root,        id: :root)
    Configuration.register_model(Max,         id: :max)
    Configuration.register_model(Min,         id: :min)
    Configuration.register_model(Gcd,         id: :gcd)
    Configuration.register_model(Lcm,         id: :lcm)
    Configuration.register_model(Sum,         id: :sum)
    Configuration.register_model(Product,     id: :product)
    Configuration.register_model(Factorial,   id: :factorial)

    # Calculus
    Configuration.register_model(Int,         id: :int)
    Configuration.register_model(Diff,        id: :diff)
    Configuration.register_model(Partialdiff, id: :partialdiff)
    Configuration.register_model(Limit,       id: :limit)
    Configuration.register_model(Lowlimit,    id: :lowlimit)
    Configuration.register_model(Uplimit,     id: :uplimit)
    Configuration.register_model(Tendsto,     id: :tendsto)

    # Elementary functions
    Configuration.register_model(Exp,      id: :exp)
    Configuration.register_model(Ln,       id: :ln)
    Configuration.register_model(Log,      id: :log)
    Configuration.register_model(Logbase,  id: :logbase)
    Configuration.register_model(Sin,      id: :sin)
    Configuration.register_model(Cos,      id: :cos)
    Configuration.register_model(Tan,      id: :tan)
    Configuration.register_model(Sec,      id: :sec)
    Configuration.register_model(Csc,      id: :csc)
    Configuration.register_model(Cot,      id: :cot)
    Configuration.register_model(Arcsin,   id: :arcsin)
    Configuration.register_model(Arccos,   id: :arccos)
    Configuration.register_model(Arctan,   id: :arctan)
    Configuration.register_model(Arccot,   id: :arccot)
    Configuration.register_model(Arccsc,   id: :arccsc)
    Configuration.register_model(Arcsec,   id: :arcsec)
    Configuration.register_model(Sinh,     id: :sinh)
    Configuration.register_model(Cosh,     id: :cosh)
    Configuration.register_model(Tanh,     id: :tanh)
    Configuration.register_model(Sech,     id: :sech)
    Configuration.register_model(Csch,     id: :csch)
    Configuration.register_model(Coth,     id: :coth)
    Configuration.register_model(Arcsinh,  id: :arcsinh)
    Configuration.register_model(Arccosh,  id: :arccosh)
    Configuration.register_model(Arctanh,  id: :arctanh)
    Configuration.register_model(Arccoth,  id: :arccoth)
    Configuration.register_model(Arccsch,  id: :arccsch)
    Configuration.register_model(Arcsech,  id: :arcsech)

    # Logic
    Configuration.register_model(And,      id: :and)
    Configuration.register_model(Or,       id: :or)
    Configuration.register_model(Xor,      id: :xor)
    Configuration.register_model(Not,      id: :not)
    Configuration.register_model(Exists,   id: :exists)
    Configuration.register_model(Forall,   id: :forall)
    Configuration.register_model(Implies,  id: :implies)

    # Functions
    Configuration.register_model(Compose,             id: :compose)
    Configuration.register_model(Domain,              id: :domain)
    Configuration.register_model(Codomain,            id: :codomain)
    Configuration.register_model(Image,               id: :image)
    Configuration.register_model(Ident,               id: :ident)
    Configuration.register_model(Domainofapplication, id: :domainofapplication)

    # Relations
    Configuration.register_model(Eq,          id: :eq)
    Configuration.register_model(Neq,         id: :neq)
    Configuration.register_model(Leq,         id: :leq)
    Configuration.register_model(Lt,          id: :lt)
    Configuration.register_model(Geq,         id: :geq)
    Configuration.register_model(Gt,          id: :gt)
    Configuration.register_model(Equivalent,  id: :equivalent)
    Configuration.register_model(Approx,      id: :approx)
    Configuration.register_model(Factorof,    id: :factorof)

    # Sets
    Configuration.register_model(Set,              id: :set)
    Configuration.register_model(Mlist,            id: :list)
    Configuration.register_model(Union,            id: :union)
    Configuration.register_model(Intersect,        id: :intersect)
    Configuration.register_model(In,               id: :in)
    Configuration.register_model(Notin,            id: :notin)
    Configuration.register_model(Subset,           id: :subset)
    Configuration.register_model(Prsubset,         id: :prsubset)
    Configuration.register_model(Notsubset,        id: :notsubset)
    Configuration.register_model(Notprsubset,      id: :notprsubset)
    Configuration.register_model(Setdiff,          id: :setdiff)
    Configuration.register_model(Card,             id: :card)
    Configuration.register_model(Cartesianproduct, id: :cartesianproduct)

    # Vector calculus
    Configuration.register_model(Divergence, id: :divergence)
    Configuration.register_model(Grad,       id: :grad)
    Configuration.register_model(Curl,       id: :curl)
    Configuration.register_model(Laplacian,  id: :laplacian)

    # Constants
    Configuration.register_model(Naturalnumbers, id: :naturalnumbers)
    Configuration.register_model(Primes,         id: :primes)
    Configuration.register_model(Integers,       id: :integers)
    Configuration.register_model(Rationals,      id: :rationals)
    Configuration.register_model(Reals,          id: :reals)
    Configuration.register_model(Complexes,      id: :complexes)
    Configuration.register_model(Emptyset,       id: :emptyset)
    Configuration.register_model(Exponentiale,   id: :exponentiale)
    Configuration.register_model(Imaginaryi,     id: :imaginaryi)
    Configuration.register_model(Pi,             id: :pi)
    Configuration.register_model(Eulergamma,     id: :eulergamma)
    Configuration.register_model(Mtrue,          id: :true) # rubocop:disable Lint/BooleanSymbol
    Configuration.register_model(Mfalse,         id: :false) # rubocop:disable Lint/BooleanSymbol
    Configuration.register_model(Infinity,       id: :infinity)
    Configuration.register_model(Notanumber,     id: :notanumber)

    # Linear algebra
    Configuration.register_model(Vector,         id: :vector)
    Configuration.register_model(Matrix,         id: :matrix)
    Configuration.register_model(Matrixrow,      id: :matrixrow)
    Configuration.register_model(Determinant,    id: :determinant)
    Configuration.register_model(Transpose,      id: :transpose)
    Configuration.register_model(Selector,       id: :selector)
    Configuration.register_model(Vectorproduct,  id: :vectorproduct)
    Configuration.register_model(Scalarproduct,  id: :scalarproduct)
    Configuration.register_model(Outerproduct,   id: :outerproduct)

    # Statistics
    Configuration.register_model(Mean,        id: :mean)
    Configuration.register_model(Sdev,        id: :sdev)
    Configuration.register_model(Variance,    id: :variance)
    Configuration.register_model(Median,      id: :median)
    Configuration.register_model(Mode,        id: :mode)
    Configuration.register_model(Moment,      id: :moment)
    Configuration.register_model(Momentabout, id: :momentabout)
  end
end
