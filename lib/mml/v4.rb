# frozen_string_literal: true

require "lutaml/model"
require_relative "versioned_parser"

Moxml::Config.default_adapter = Mml::DEFAULT_ADAPTER

require_relative "v4/configuration"
require_relative "v4/namespace"
require_relative "v4/common_elements"

module Mml
  module V4
    extend Mml::VersionedParser

    # Presentation elements
    autoload :A,             "mml/v4/a"
    autoload :Maction,       "mml/v4/maction"
    autoload :Maligngroup,   "mml/v4/maligngroup"
    autoload :Malignmark,    "mml/v4/malignmark"
    autoload :Menclose,      "mml/v4/menclose"
    autoload :Merror,       "mml/v4/merror"
    autoload :Mfenced,      "mml/v4/mfenced"
    autoload :Mfrac,        "mml/v4/mfrac"
    autoload :Mfraction,    "mml/v4/mfraction"
    autoload :Mglyph,       "mml/v4/mglyph"
    autoload :Mi, "mml/v4/mi"
    autoload :Mlongdiv, "mml/v4/mlongdiv"
    autoload :Mn,            "mml/v4/mn"
    autoload :Mo,            "mml/v4/mo"
    autoload :Mover,        "mml/v4/mover"
    autoload :Mpadded,      "mml/v4/mpadded"
    autoload :Mphantom,     "mml/v4/mphantom"
    autoload :Mprescripts,  "mml/v4/mprescripts"
    autoload :Mroot,        "mml/v4/mroot"
    autoload :Mrow,         "mml/v4/mrow"
    autoload :Ms, "mml/v4/ms"
    autoload :Mscarries,    "mml/v4/mscarries"
    autoload :Mscarry,      "mml/v4/mscarry"
    autoload :Msgroup,      "mml/v4/msgroup"
    autoload :Msline,       "mml/v4/msline"
    autoload :Mspace,       "mml/v4/mspace"
    autoload :Msqrt,        "mml/v4/msqrt"
    autoload :Msrow,        "mml/v4/msrow"
    autoload :Mstack,       "mml/v4/mstack"
    autoload :Mstyle,       "mml/v4/mstyle"
    autoload :Msub,         "mml/v4/msub"
    autoload :Msubsup,      "mml/v4/msubsup"
    autoload :Msup,         "mml/v4/msup"
    autoload :Mtd,          "mml/v4/mtd"
    autoload :Mtable,       "mml/v4/mtable"
    autoload :Mtext,        "mml/v4/mtext"
    autoload :Mtr,          "mml/v4/mtr"
    autoload :Mlabeledtr, "mml/v4/mlabeledtr"
    autoload :Munder,       "mml/v4/munder"
    autoload :Munderover,   "mml/v4/munderover"
    autoload :Mmultiscripts, "mml/v4/mmultiscripts"
    autoload :None,         "mml/v4/none"
    autoload :Semantics,    "mml/v4/semantics"
    autoload :Math,         "mml/v4/math"

    # Content elements - autoloaded individually
    autoload :AnnotationXml, "mml/v4/annotation_xml"
    autoload :Annotation, "mml/v4/annotation"
    autoload :Apply, "mml/v4/apply"
    autoload :Ci,           "mml/v4/ci"
    autoload :Cn,           "mml/v4/cn"
    autoload :Csymbol,      "mml/v4/csymbol"
    autoload :Bvar,         "mml/v4/constructs"
    autoload :Condition,    "mml/v4/constructs"
    autoload :Interval,     "mml/v4/constructs"
    autoload :Lambda,       "mml/v4/constructs"
    autoload :Inverse,      "mml/v4/constructs"
    autoload :Degree,       "mml/v4/constructs"
    autoload :Piecewise,    "mml/v4/constructs"
    autoload :Piece,        "mml/v4/constructs"
    autoload :Otherwise, "mml/v4/constructs"
    autoload :Sep,          "mml/v4/constructs"
    autoload :Bind,         "mml/v4/constructs"
    autoload :Fn,           "mml/v4/deprecated_content"
    autoload :Reln,         "mml/v4/deprecated_content"
    autoload :Declare,      "mml/v4/deprecated_content"
    autoload :Share,        "mml/v4/deprecated_content"
    autoload :Abs,          "mml/v4/arith"
    autoload :Conjugate, "mml/v4/arith"
    autoload :Arg,          "mml/v4/arith"
    autoload :Real,         "mml/v4/arith"
    autoload :Imaginary, "mml/v4/arith"
    autoload :Floor,        "mml/v4/arith"
    autoload :Ceiling,      "mml/v4/arith"
    autoload :Quotient,     "mml/v4/arith"
    autoload :Divide,       "mml/v4/arith"
    autoload :Rem,          "mml/v4/arith"
    autoload :Minus,        "mml/v4/arith"
    autoload :Plus,         "mml/v4/arith"
    autoload :Times,        "mml/v4/arith"
    autoload :Power,        "mml/v4/arith"
    autoload :Root,         "mml/v4/arith"
    autoload :Max,          "mml/v4/arith"
    autoload :Min,          "mml/v4/arith"
    autoload :Gcd,          "mml/v4/arith"
    autoload :Lcm,          "mml/v4/arith"
    autoload :Sum,          "mml/v4/arith"
    autoload :Product,      "mml/v4/arith"
    autoload :Factorial,    "mml/v4/arith"
    autoload :And,          "mml/v4/logic"
    autoload :Or,           "mml/v4/logic"
    autoload :Xor,          "mml/v4/logic"
    autoload :Not,          "mml/v4/logic"
    autoload :Implies,     "mml/v4/logic"
    autoload :Forall,      "mml/v4/logic"
    autoload :Exists,      "mml/v4/logic"
    autoload :Eq,           "mml/v4/relations"
    autoload :Neq,          "mml/v4/relations"
    autoload :Lt,           "mml/v4/relations"
    autoload :Gt,           "mml/v4/relations"
    autoload :Leq,          "mml/v4/relations"
    autoload :Geq,          "mml/v4/relations"
    autoload :Equivalent,   "mml/v4/relations"
    autoload :Approx,       "mml/v4/relations"
    autoload :Set,          "mml/v4/sets"
    autoload :List,         "mml/v4/sets"
    autoload :Union,        "mml/v4/sets"
    autoload :Intersect,    "mml/v4/sets"
    autoload :In,           "mml/v4/sets"
    autoload :Notin,        "mml/v4/sets"
    autoload :Notsubset,    "mml/v4/sets"
    autoload :Notprsubset,  "mml/v4/sets"
    autoload :Subset,       "mml/v4/sets"
    autoload :Prsubset,     "mml/v4/sets"
    autoload :Setdiff,      "mml/v4/sets"
    autoload :Card,         "mml/v4/sets"
    autoload :Cartesianproduct, "mml/v4/sets"
    autoload :Diff,         "mml/v4/calculus"
    autoload :Partialdiff,  "mml/v4/calculus"
    autoload :Int,          "mml/v4/calculus"
    autoload :Lowlimit,     "mml/v4/calculus"
    autoload :Uplimit,      "mml/v4/calculus"
    autoload :Divergence,   "mml/v4/vector_calculus"
    autoload :Grad,         "mml/v4/vector_calculus"
    autoload :Curl,         "mml/v4/vector_calculus"
    autoload :Laplacian,    "mml/v4/vector_calculus"
    autoload :Compose,      "mml/v4/functions"
    autoload :Domain,       "mml/v4/functions"
    autoload :Codomain,     "mml/v4/functions"
    autoload :Image,        "mml/v4/functions"
    autoload :Ident,        "mml/v4/functions"
    autoload :Sin,          "mml/v4/elementary_functions"
    autoload :Cos,          "mml/v4/elementary_functions"
    autoload :Tan,          "mml/v4/elementary_functions"
    autoload :Sec,          "mml/v4/elementary_functions"
    autoload :Csc,          "mml/v4/elementary_functions"
    autoload :Cot,          "mml/v4/elementary_functions"
    autoload :Sinh,         "mml/v4/elementary_functions"
    autoload :Cosh,         "mml/v4/elementary_functions"
    autoload :Tanh,         "mml/v4/elementary_functions"
    autoload :Sech,         "mml/v4/elementary_functions"
    autoload :Csch,         "mml/v4/elementary_functions"
    autoload :Coth,         "mml/v4/elementary_functions"
    autoload :Arcsin,       "mml/v4/elementary_functions"
    autoload :Arccos,       "mml/v4/elementary_functions"
    autoload :Arctan,       "mml/v4/elementary_functions"
    autoload :Arcsec,       "mml/v4/elementary_functions"
    autoload :Arccsc,       "mml/v4/elementary_functions"
    autoload :Arccot,       "mml/v4/elementary_functions"
    autoload :Arcsinh,      "mml/v4/elementary_functions"
    autoload :Arccosh,      "mml/v4/elementary_functions"
    autoload :Arctanh,      "mml/v4/elementary_functions"
    autoload :Arcsech,      "mml/v4/elementary_functions"
    autoload :Arccsch,      "mml/v4/elementary_functions"
    autoload :Arccoth,      "mml/v4/elementary_functions"
    autoload :Exp,          "mml/v4/elementary_functions"
    autoload :Ln,           "mml/v4/elementary_functions"
    autoload :Log,          "mml/v4/elementary_functions"
    autoload :Integers,     "mml/v4/constants"
    autoload :Reals,        "mml/v4/constants"
    autoload :Rationals,    "mml/v4/constants"
    autoload :Naturalnumbers, "mml/v4/constants"
    autoload :Complexes,    "mml/v4/constants"
    autoload :Primes,       "mml/v4/constants"
    autoload :Exponentiale, "mml/v4/constants"
    autoload :Imaginaryi,   "mml/v4/constants"
    autoload :Notanumber,   "mml/v4/constants"
    autoload :True,         "mml/v4/constants"
    autoload :False,        "mml/v4/constants"
    autoload :Emptyset,     "mml/v4/constants"
    autoload :Pi,           "mml/v4/constants"
    autoload :Eulergamma,   "mml/v4/constants"
    autoload :Infinity,     "mml/v4/constants"
    autoload :Vector,       "mml/v4/linear_algebra"
    autoload :Matrix,       "mml/v4/linear_algebra"
    autoload :Matrixrow,    "mml/v4/linear_algebra"
    autoload :Determinant,  "mml/v4/linear_algebra"
    autoload :Transpose,    "mml/v4/linear_algebra"
    autoload :Selector,     "mml/v4/linear_algebra"
    autoload :Vectorproduct,  "mml/v4/linear_algebra"
    autoload :Scalarproduct,  "mml/v4/linear_algebra"
    autoload :Outerproduct,   "mml/v4/linear_algebra"
    autoload :Mean,         "mml/v4/statistics"
    autoload :Sdev,         "mml/v4/statistics"
    autoload :Variance,     "mml/v4/statistics"
    autoload :Median,       "mml/v4/statistics"
    autoload :Mode,         "mml/v4/statistics"
    autoload :Moment,       "mml/v4/statistics"
    autoload :Momentabout,  "mml/v4/statistics"

    # Presentation element registrations
    Configuration.register_model(A,             id: :a)
    Configuration.register_model(Maction,       id: :maction)
    Configuration.register_model(Maligngroup,   id: :maligngroup)
    Configuration.register_model(Malignmark,    id: :malignmark)
    Configuration.register_model(Menclose,      id: :menclose)
    Configuration.register_model(Merror,        id: :merror)
    Configuration.register_model(Mfenced,      id: :mfenced)
    Configuration.register_model(Mfrac,        id: :mfrac)
    Configuration.register_model(Mfraction,    id: :mfraction)
    Configuration.register_model(Mglyph,       id: :mglyph)
    Configuration.register_model(Mi,            id: :mi)
    Configuration.register_model(Mlongdiv,      id: :mlongdiv)
    Configuration.register_model(Mn,            id: :mn)
    Configuration.register_model(Mo,            id: :mo)
    Configuration.register_model(Mover, id: :mover)
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
    Configuration.register_model(Mtd,           id: :mtd)
    Configuration.register_model(Mtable,        id: :mtable)
    Configuration.register_model(Mtext,         id: :mtext)
    Configuration.register_model(Mtr,           id: :mtr)
    Configuration.register_model(Mlabeledtr,    id: :mlabeledtr)
    Configuration.register_model(Munder,        id: :munder)
    Configuration.register_model(Munderover,    id: :munderover)
    Configuration.register_model(Mmultiscripts, id: :mmultiscripts)
    Configuration.register_model(None, id: :none)
    Configuration.register_model(Semantics, id: :semantics)
    Configuration.register_model(Math,          id: :math)

    # Content element registrations
    Configuration.register_model(AnnotationXml, id: :"annotation-xml")
    Configuration.register_model(Apply,         id: :apply)
    Configuration.register_model(Ci,             id: :ci)
    Configuration.register_model(Cn,             id: :cn)
    Configuration.register_model(Csymbol,        id: :csymbol)

    # Constructs (bvar, condition, interval, lambda, inverse, degree, piecewise, piece, otherwise, sep, bind)
    Configuration.register_model(Bvar, id: :bvar)
    Configuration.register_model(Condition, id: :condition)
    Configuration.register_model(Interval, id: :interval)
    Configuration.register_model(Lambda, id: :lambda)
    Configuration.register_model(Inverse, id: :inverse)
    Configuration.register_model(Degree, id: :degree)
    Configuration.register_model(Piecewise,     id: :piecewise)
    Configuration.register_model(Piece,         id: :piece)
    Configuration.register_model(Otherwise,     id: :otherwise)
    Configuration.register_model(Sep,            id: :sep)
    Configuration.register_model(Bind,           id: :bind)

    # V2 compatibility (fn, reln, declare, share)
    Configuration.register_model(Fn, id: :fn)
    Configuration.register_model(Reln, id: :reln)
    Configuration.register_model(Declare, id: :declare)
    Configuration.register_model(Share, id: :share)

    # Arith (22 classes)
    Configuration.register_model(Abs,         id: :abs)
    Configuration.register_model(Conjugate,   id: :conjugate)
    Configuration.register_model(Arg,         id: :arg)
    Configuration.register_model(Real,        id: :real)
    Configuration.register_model(Imaginary,   id: :imaginary)
    Configuration.register_model(Floor,       id: :floor)
    Configuration.register_model(Ceiling,    id: :ceiling)
    Configuration.register_model(Quotient,   id: :quotient)
    Configuration.register_model(Divide,     id: :divide)
    Configuration.register_model(Rem, id: :rem)
    Configuration.register_model(Minus, id: :minus)
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
    Configuration.register_model(Factorial,  id: :factorial)

    # Logic (7)
    Configuration.register_model(And,        id: :and)
    Configuration.register_model(Or,         id: :or)
    Configuration.register_model(Xor,        id: :xor)
    Configuration.register_model(Not,        id: :not)
    Configuration.register_model(Implies,    id: :implies)
    Configuration.register_model(Forall,     id: :forall)
    Configuration.register_model(Exists,     id: :exists)

    # Relations (8 - no Factorof)
    Configuration.register_model(Eq,          id: :eq)
    Configuration.register_model(Neq,         id: :neq)
    Configuration.register_model(Lt,          id: :lt)
    Configuration.register_model(Gt,          id: :gt)
    Configuration.register_model(Leq,         id: :leq)
    Configuration.register_model(Geq,         id: :geq)
    Configuration.register_model(Equivalent, id: :equivalent)
    Configuration.register_model(Approx, id: :approx)

    # Sets (13 - uses List not Mlist)
    Configuration.register_model(Set, id: :set)
    Configuration.register_model(List,             id: :list)
    Configuration.register_model(Union,            id: :union)
    Configuration.register_model(Intersect,        id: :intersect)
    Configuration.register_model(In, id: :in)
    Configuration.register_model(Notin, id: :notin)
    Configuration.register_model(Notsubset,       id: :notsubset)
    Configuration.register_model(Notprsubset,     id: :notprsubset)
    Configuration.register_model(Subset,            id: :subset)
    Configuration.register_model(Prsubset,          id: :prsubset)
    Configuration.register_model(Setdiff, id: :setdiff)
    Configuration.register_model(Card, id: :card)
    Configuration.register_model(Cartesianproduct, id: :cartesianproduct)

    # Calculus (5 - no Limit, Tendsto)
    Configuration.register_model(Diff,         id: :diff)
    Configuration.register_model(Partialdiff,  id: :partialdiff)
    Configuration.register_model(Int, id: :int)
    Configuration.register_model(Lowlimit, id: :lowlimit)
    Configuration.register_model(Uplimit, id: :uplimit)

    # Vector Calculus (4)
    Configuration.register_model(Divergence, id: :divergence)
    Configuration.register_model(Grad, id: :grad)
    Configuration.register_model(Curl,         id: :curl)
    Configuration.register_model(Laplacian,    id: :laplacian)

    # Functions (5 - no Domainofapplication)
    Configuration.register_model(Compose,   id: :compose)
    Configuration.register_model(Domain,    id: :domain)
    Configuration.register_model(Codomain,  id: :codomain)
    Configuration.register_model(Image,     id: :image)
    Configuration.register_model(Ident, id: :ident)

    # Elementary Functions (27 - no Logbase)
    Configuration.register_model(Sin,       id: :sin)
    Configuration.register_model(Cos,       id: :cos)
    Configuration.register_model(Tan,       id: :tan)
    Configuration.register_model(Sec,       id: :sec)
    Configuration.register_model(Csc,       id: :csc)
    Configuration.register_model(Cot,       id: :cot)
    Configuration.register_model(Sinh,       id: :sinh)
    Configuration.register_model(Cosh,       id: :cosh)
    Configuration.register_model(Tanh,       id: :tanh)
    Configuration.register_model(Sech,       id: :sech)
    Configuration.register_model(Csch,       id: :csch)
    Configuration.register_model(Coth,       id: :coth)
    Configuration.register_model(Arcsin,     id: :arcsin)
    Configuration.register_model(Arccos,     id: :arccos)
    Configuration.register_model(Arctan,     id: :arctan)
    Configuration.register_model(Arcsec,     id: :arcsec)
    Configuration.register_model(Arccsc,     id: :arccsc)
    Configuration.register_model(Arccot,     id: :arccot)
    Configuration.register_model(Arcsinh,   id: :arcsinh)
    Configuration.register_model(Arccosh,   id: :arccosh)
    Configuration.register_model(Arctanh,   id: :arctanh)
    Configuration.register_model(Arcsech,   id: :arcsech)
    Configuration.register_model(Arccsch,   id: :arccsch)
    Configuration.register_model(Arccoth,   id: :arccoth)
    Configuration.register_model(Exp,       id: :exp)
    Configuration.register_model(Ln,         id: :ln)
    Configuration.register_model(Log,        id: :log)

    # Constants (15 - uses True/False not Mtrue/Mfalse)
    Configuration.register_model(Integers,       id: :integers)
    Configuration.register_model(Reals,           id: :reals)
    Configuration.register_model(Rationals,       id: :rationals)
    Configuration.register_model(Naturalnumbers,  id: :naturalnumbers)
    Configuration.register_model(Complexes,       id: :complexes)
    Configuration.register_model(Primes,          id: :primes)
    Configuration.register_model(Exponentiale, id: :exponentiale)
    Configuration.register_model(Imaginaryi, id: :imaginaryi)
    Configuration.register_model(Notanumber, id: :notanumber)
    Configuration.register_model(True, id: :true) # rubocop:disable Lint/BooleanSymbol
    Configuration.register_model(False, id: :false) # rubocop:disable Lint/BooleanSymbol
    Configuration.register_model(Emptyset, id: :emptyset)
    Configuration.register_model(Pi, id: :pi)
    Configuration.register_model(Eulergamma, id: :eulergamma)
    Configuration.register_model(Infinity, id: :infinity)

    # Linear Algebra (9)
    Configuration.register_model(Vector, id: :vector)
    Configuration.register_model(Matrix,          id: :matrix)
    Configuration.register_model(Matrixrow,       id: :matrixrow)
    Configuration.register_model(Determinant,     id: :determinant)
    Configuration.register_model(Transpose,       id: :transpose)
    Configuration.register_model(Selector,        id: :selector)
    Configuration.register_model(Vectorproduct,   id: :vectorproduct)
    Configuration.register_model(Scalarproduct,   id: :scalarproduct)
    Configuration.register_model(Outerproduct,    id: :outerproduct)

    # Statistics (7)
    Configuration.register_model(Mean,         id: :mean)
    Configuration.register_model(Sdev,         id: :sdev)
    Configuration.register_model(Variance,     id: :variance)
    Configuration.register_model(Median,       id: :median)
    Configuration.register_model(Mode,         id: :mode)
    Configuration.register_model(Moment,       id: :moment)
    Configuration.register_model(Momentabout,  id: :momentabout)
  end
end
