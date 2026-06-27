# frozen_string_literal: true

require "lutaml/model"

module Mml
  module V2
    extend Mml::VersionedParser

    autoload :Configuration, "mml/v2/configuration"
    autoload :Namespace,     "mml/v2/namespace"
    autoload :CommonElements, "mml/v2/common_elements"

    # Presentation elements
    autoload :Maction,       "mml/v2/maction"
    autoload :Maligngroup,   "mml/v2/maligngroup"
    autoload :Malignmark,    "mml/v2/malignmark"
    autoload :Menclose,      "mml/v2/menclose"
    autoload :Merror,        "mml/v2/merror"
    autoload :Mfenced,       "mml/v2/mfenced"
    autoload :Mfrac,         "mml/v2/mfrac"
    autoload :Mfraction,     "mml/v2/mfraction"
    autoload :Mglyph,        "mml/v2/mglyph"
    autoload :Mi,            "mml/v2/mi"
    autoload :Mlabeledtr,    "mml/v2/mlabeledtr"
    autoload :Mlongdiv,      "mml/v2/mlongdiv"
    autoload :Mmultiscripts, "mml/v2/mmultiscripts"
    autoload :Mn,            "mml/v2/mn"
    autoload :Mo,            "mml/v2/mo"
    autoload :Mover,         "mml/v2/mover"
    autoload :Mpadded,       "mml/v2/mpadded"
    autoload :Mphantom,      "mml/v2/mphantom"
    autoload :Mprescripts,   "mml/v2/mprescripts"
    autoload :Mroot,         "mml/v2/mroot"
    autoload :Mrow,          "mml/v2/mrow"
    autoload :Ms,            "mml/v2/ms"
    autoload :Mscarries,     "mml/v2/mscarries"
    autoload :Mscarry,       "mml/v2/mscarry"
    autoload :Msgroup,       "mml/v2/msgroup"
    autoload :Msline,        "mml/v2/msline"
    autoload :Mspace,        "mml/v2/mspace"
    autoload :Msqrt,         "mml/v2/msqrt"
    autoload :Msrow,         "mml/v2/msrow"
    autoload :Mstack,        "mml/v2/mstack"
    autoload :Mstyle,        "mml/v2/mstyle"
    autoload :Msub,          "mml/v2/msub"
    autoload :Msubsup,       "mml/v2/msubsup"
    autoload :Msup,          "mml/v2/msup"
    autoload :Mtable,        "mml/v2/mtable"
    autoload :Mtd,           "mml/v2/mtd"
    autoload :Mtext,         "mml/v2/mtext"
    autoload :Mtr,           "mml/v2/mtr"
    autoload :Munder,        "mml/v2/munder"
    autoload :Munderover,    "mml/v2/munderover"
    autoload :None,          "mml/v2/none"
    autoload :Semantics,     "mml/v2/semantics"
    autoload :Math,          "mml/v2/math"

    # Content elements (single-class files)
    autoload :Annotation,    "mml/v2/annotation"
    autoload :AnnotationXml, "mml/v2/annotation_xml"
    autoload :Apply,         "mml/v2/apply"
    autoload :Bvar,          "mml/v2/bvar"
    autoload :Bind,          "mml/v2/bind"
    autoload :Ci,            "mml/v2/ci"
    autoload :Cn,            "mml/v2/cn"
    autoload :Condition,     "mml/v2/condition"
    autoload :Csymbol,       "mml/v2/csymbol"
    autoload :Degree,        "mml/v2/degree"
    autoload :Fn,            "mml/v2/fn"
    autoload :Interval,      "mml/v2/interval"
    autoload :Inverse,       "mml/v2/inverse"
    autoload :Lambda,        "mml/v2/lambda"
    autoload :Otherwise,     "mml/v2/otherwise"
    autoload :Piece,         "mml/v2/piece"
    autoload :Piecewise,     "mml/v2/piecewise"
    autoload :Reln,          "mml/v2/reln"
    autoload :Sep,           "mml/v2/sep"

    # Content elements (batch files)
    autoload :Abs,           "mml/v2/arith"
    autoload :Conjugate,     "mml/v2/arith"
    autoload :Arg,           "mml/v2/arith"
    autoload :Real,          "mml/v2/arith"
    autoload :Imaginary,     "mml/v2/arith"
    autoload :Floor,         "mml/v2/arith"
    autoload :Ceiling,       "mml/v2/arith"
    autoload :Quotient,      "mml/v2/arith"
    autoload :Divide,        "mml/v2/arith"
    autoload :Rem,           "mml/v2/arith"
    autoload :Minus,         "mml/v2/arith"
    autoload :Plus,          "mml/v2/arith"
    autoload :Times,         "mml/v2/arith"
    autoload :Power,         "mml/v2/arith"
    autoload :Root,          "mml/v2/arith"
    autoload :Max,           "mml/v2/arith"
    autoload :Min,           "mml/v2/arith"
    autoload :Gcd,           "mml/v2/arith"
    autoload :Lcm,           "mml/v2/arith"
    autoload :Sum,           "mml/v2/arith"
    autoload :Product,       "mml/v2/arith"
    autoload :Factorial,     "mml/v2/arith"

    autoload :Int,           "mml/v2/calculus"
    autoload :Diff,          "mml/v2/calculus"
    autoload :Partialdiff,   "mml/v2/calculus"
    autoload :Limit,         "mml/v2/calculus"
    autoload :Lowlimit,      "mml/v2/calculus"
    autoload :Uplimit,       "mml/v2/calculus"
    autoload :Tendsto,       "mml/v2/calculus"

    autoload :Exp,           "mml/v2/elementary_functions"
    autoload :Ln,            "mml/v2/elementary_functions"
    autoload :Log,           "mml/v2/elementary_functions"
    autoload :Logbase,       "mml/v2/elementary_functions"
    autoload :Sin,           "mml/v2/elementary_functions"
    autoload :Cos,           "mml/v2/elementary_functions"
    autoload :Tan,           "mml/v2/elementary_functions"
    autoload :Sec,           "mml/v2/elementary_functions"
    autoload :Csc,           "mml/v2/elementary_functions"
    autoload :Cot,           "mml/v2/elementary_functions"
    autoload :Arcsin,        "mml/v2/elementary_functions"
    autoload :Arccos,        "mml/v2/elementary_functions"
    autoload :Arctan,        "mml/v2/elementary_functions"
    autoload :Arccot,        "mml/v2/elementary_functions"
    autoload :Arccsc,        "mml/v2/elementary_functions"
    autoload :Arcsec,        "mml/v2/elementary_functions"
    autoload :Sinh,          "mml/v2/elementary_functions"
    autoload :Cosh,          "mml/v2/elementary_functions"
    autoload :Tanh,          "mml/v2/elementary_functions"
    autoload :Sech,          "mml/v2/elementary_functions"
    autoload :Csch,          "mml/v2/elementary_functions"
    autoload :Coth,          "mml/v2/elementary_functions"
    autoload :Arcsinh,       "mml/v2/elementary_functions"
    autoload :Arccosh,       "mml/v2/elementary_functions"
    autoload :Arctanh,       "mml/v2/elementary_functions"
    autoload :Arccoth,       "mml/v2/elementary_functions"
    autoload :Arccsch,       "mml/v2/elementary_functions"
    autoload :Arcsech,       "mml/v2/elementary_functions"

    autoload :And,           "mml/v2/logic"
    autoload :Or,            "mml/v2/logic"
    autoload :Xor,           "mml/v2/logic"
    autoload :Not,           "mml/v2/logic"
    autoload :Exists,        "mml/v2/logic"
    autoload :Forall,        "mml/v2/logic"
    autoload :Implies,       "mml/v2/logic"

    autoload :Compose,              "mml/v2/functions"
    autoload :Domain,               "mml/v2/functions"
    autoload :Codomain,             "mml/v2/functions"
    autoload :Image,                "mml/v2/functions"
    autoload :Ident,                "mml/v2/functions"
    autoload :Domainofapplication,  "mml/v2/functions"

    autoload :Eq,            "mml/v2/relations"
    autoload :Neq,           "mml/v2/relations"
    autoload :Leq,           "mml/v2/relations"
    autoload :Lt,            "mml/v2/relations"
    autoload :Geq,           "mml/v2/relations"
    autoload :Gt,            "mml/v2/relations"
    autoload :Equivalent,    "mml/v2/relations"
    autoload :Approx,        "mml/v2/relations"
    autoload :Factorof,      "mml/v2/relations"

    autoload :Set,             "mml/v2/sets"
    autoload :Mlist,           "mml/v2/sets"
    autoload :Union,           "mml/v2/sets"
    autoload :Intersect,       "mml/v2/sets"
    autoload :In,              "mml/v2/sets"
    autoload :Notin,           "mml/v2/sets"
    autoload :Subset,          "mml/v2/sets"
    autoload :Prsubset,        "mml/v2/sets"
    autoload :Notsubset,       "mml/v2/sets"
    autoload :Notprsubset,     "mml/v2/sets"
    autoload :Setdiff,         "mml/v2/sets"
    autoload :Card,            "mml/v2/sets"
    autoload :Cartesianproduct, "mml/v2/sets"

    autoload :Divergence,    "mml/v2/vector_calculus"
    autoload :Grad,          "mml/v2/vector_calculus"
    autoload :Curl,          "mml/v2/vector_calculus"
    autoload :Laplacian,     "mml/v2/vector_calculus"

    autoload :Naturalnumbers, "mml/v2/constants"
    autoload :Primes,         "mml/v2/constants"
    autoload :Integers,       "mml/v2/constants"
    autoload :Rationals,      "mml/v2/constants"
    autoload :Reals,          "mml/v2/constants"
    autoload :Complexes,      "mml/v2/constants"
    autoload :Emptyset,       "mml/v2/constants"
    autoload :Exponentiale,   "mml/v2/constants"
    autoload :Imaginaryi,     "mml/v2/constants"
    autoload :Pi,             "mml/v2/constants"
    autoload :Eulergamma,     "mml/v2/constants"
    autoload :Mtrue,          "mml/v2/constants" # rubocop:disable Lint/BooleanSymbol
    autoload :Mfalse,         "mml/v2/constants" # rubocop:disable Lint/BooleanSymbol
    autoload :Infinity,       "mml/v2/constants"
    autoload :Notanumber,     "mml/v2/constants"

    autoload :Vector,         "mml/v2/linear_algebra"
    autoload :Matrix,         "mml/v2/linear_algebra"
    autoload :Matrixrow,      "mml/v2/linear_algebra"
    autoload :Determinant,    "mml/v2/linear_algebra"
    autoload :Transpose,      "mml/v2/linear_algebra"
    autoload :Selector,       "mml/v2/linear_algebra"
    autoload :Vectorproduct,  "mml/v2/linear_algebra"
    autoload :Scalarproduct,  "mml/v2/linear_algebra"
    autoload :Outerproduct,   "mml/v2/linear_algebra"

    autoload :Mean,           "mml/v2/statistics"
    autoload :Sdev,           "mml/v2/statistics"
    autoload :Variance,       "mml/v2/statistics"
    autoload :Median,         "mml/v2/statistics"
    autoload :Mode,           "mml/v2/statistics"
    autoload :Moment,         "mml/v2/statistics"
    autoload :Momentabout,    "mml/v2/statistics"

    # Centralized registration. Called lazily by VersionedParser#parse via
    # ensure_registered! so the version module body stays side-effect free
    # at load time (required for Opal, where autoloads don't lazy-trigger
    # and the boot file eager-loads every element file before this runs).
    def self.register_models! # rubocop:disable Metrics/MethodLength
      # Presentation element registrations
      Configuration.register_model(Maction, id: :maction)
      Configuration.register_model(Maligngroup,   id: :maligngroup)
      Configuration.register_model(Malignmark,    id: :malignmark)
      Configuration.register_model(Menclose,      id: :menclose)
      Configuration.register_model(Merror,        id: :merror)
      Configuration.register_model(Mfenced,       id: :mfenced)
      Configuration.register_model(Mfrac,         id: :mfrac)
      Configuration.register_model(Mfraction,     id: :mfraction)
      Configuration.register_model(Mglyph,         id: :mglyph)
      Configuration.register_model(Mi,             id: :mi)
      Configuration.register_model(Mlabeledtr,     id: :mlabeledtr)
      Configuration.register_model(Mlongdiv,       id: :mlongdiv)
      Configuration.register_model(Mmultiscripts,  id: :mmultiscripts)
      Configuration.register_model(Mn,             id: :mn)
      Configuration.register_model(Mo,             id: :mo)
      Configuration.register_model(Mover,          id: :mover)
      Configuration.register_model(Mpadded,        id: :mpadded)
      Configuration.register_model(Mphantom,        id: :mphantom)
      Configuration.register_model(Mprescripts,     id: :mprescripts)
      Configuration.register_model(Mroot,          id: :mroot)
      Configuration.register_model(Mrow,           id: :mrow)
      Configuration.register_model(Ms,             id: :ms)
      Configuration.register_model(Mscarries,      id: :mscarries)
      Configuration.register_model(Mscarry,        id: :mscarry)
      Configuration.register_model(Msgroup,         id: :msgroup)
      Configuration.register_model(Msline,          id: :msline)
      Configuration.register_model(Mspace,          id: :mspace)
      Configuration.register_model(Msqrt,          id: :msqrt)
      Configuration.register_model(Msrow,          id: :msrow)
      Configuration.register_model(Mstack,          id: :mstack)
      Configuration.register_model(Mstyle,          id: :mstyle)
      Configuration.register_model(Msub,            id: :msub)
      Configuration.register_model(Msubsup, id: :msubsup)
      Configuration.register_model(Msup,            id: :msup)
      Configuration.register_model(Mtable,          id: :mtable)
      Configuration.register_model(Mtd, id: :mtd)
      Configuration.register_model(Mtext,           id: :mtext)
      Configuration.register_model(Mtr,             id: :mtr)
      Configuration.register_model(Munder,          id: :munder)
      Configuration.register_model(Munderover,      id: :munderover)
      Configuration.register_model(None,            id: :none)
      Configuration.register_model(Semantics,       id: :semantics)
      Configuration.register_model(Math,            id: :math)

      # Content element registrations - separate files
      Configuration.register_model(Annotation,        id: :annotation)
      Configuration.register_model(AnnotationXml,     id: :"annotation-xml")
      Configuration.register_model(Apply,             id: :apply)
      Configuration.register_model(Bvar, id: :bvar)
      Configuration.register_model(Bind,              id: :bind)
      Configuration.register_model(Ci,                id: :ci)
      Configuration.register_model(Cn,                id: :cn)
      Configuration.register_model(Condition, id: :condition)
      Configuration.register_model(Csymbol,           id: :csymbol)
      Configuration.register_model(Degree,            id: :degree)
      Configuration.register_model(Fn, id: :fn)
      Configuration.register_model(Interval,          id: :interval)
      Configuration.register_model(Inverse,           id: :inverse)
      Configuration.register_model(Lambda,             id: :lambda)
      Configuration.register_model(Otherwise,          id: :otherwise)
      Configuration.register_model(Piece,              id: :piece)
      Configuration.register_model(Piecewise,          id: :piecewise)
      Configuration.register_model(Reln, id: :reln)
      Configuration.register_model(Sep, id: :sep)

      # Content element registrations - batch files
      Configuration.register_model(Abs,          id: :abs)
      Configuration.register_model(Conjugate,    id: :conjugate)
      Configuration.register_model(Arg,         id: :arg)
      Configuration.register_model(Real,        id: :real)
      Configuration.register_model(Imaginary,   id: :imaginary)
      Configuration.register_model(Floor, id: :floor)
      Configuration.register_model(Ceiling, id: :ceiling)
      Configuration.register_model(Quotient,   id: :quotient)
      Configuration.register_model(Divide,     id: :divide)
      Configuration.register_model(Rem,         id: :rem)
      Configuration.register_model(Minus,       id: :minus)
      Configuration.register_model(Plus,        id: :plus)
      Configuration.register_model(Times,       id: :times)
      Configuration.register_model(Power, id: :power)
      Configuration.register_model(Root,        id: :root)
      Configuration.register_model(Max,         id: :max)
      Configuration.register_model(Min,         id: :min)
      Configuration.register_model(Gcd,         id: :gcd)
      Configuration.register_model(Lcm,         id: :lcm)
      Configuration.register_model(Sum,         id: :sum)
      Configuration.register_model(Product, id: :product)
      Configuration.register_model(Factorial, id: :factorial)

      Configuration.register_model(Int,          id: :int)
      Configuration.register_model(Diff,         id: :diff)
      Configuration.register_model(Partialdiff,  id: :partialdiff)
      Configuration.register_model(Limit, id: :limit)
      Configuration.register_model(Lowlimit,     id: :lowlimit)
      Configuration.register_model(Uplimit,      id: :uplimit)
      Configuration.register_model(Tendsto,      id: :tendsto)

      Configuration.register_model(Exp, id: :exp)
      Configuration.register_model(Ln,          id: :ln)
      Configuration.register_model(Log,         id: :log)
      Configuration.register_model(Logbase, id: :logbase)
      Configuration.register_model(Sin,         id: :sin)
      Configuration.register_model(Cos,         id: :cos)
      Configuration.register_model(Tan,         id: :tan)
      Configuration.register_model(Sec,         id: :sec)
      Configuration.register_model(Csc,         id: :csc)
      Configuration.register_model(Cot,         id: :cot)
      Configuration.register_model(Arcsin,     id: :arcsin)
      Configuration.register_model(Arccos,     id: :arccos)
      Configuration.register_model(Arctan, id: :arctan)
      Configuration.register_model(Arccot, id: :arccot)
      Configuration.register_model(Arccsc, id: :arccsc)
      Configuration.register_model(Arcsec,      id: :arcsec)
      Configuration.register_model(Sinh,        id: :sinh)
      Configuration.register_model(Cosh,        id: :cosh)
      Configuration.register_model(Tanh,        id: :tanh)
      Configuration.register_model(Sech,        id: :sech)
      Configuration.register_model(Csch,        id: :csch)
      Configuration.register_model(Coth,        id: :coth)
      Configuration.register_model(Arcsinh,    id: :arcsinh)
      Configuration.register_model(Arccosh,    id: :arccosh)
      Configuration.register_model(Arctanh,    id: :arctanh)
      Configuration.register_model(Arccoth,    id: :arccoth)
      Configuration.register_model(Arccsch,    id: :arccsch)
      Configuration.register_model(Arcsech,    id: :arcsech)

      Configuration.register_model(And,         id: :and)
      Configuration.register_model(Or,          id: :or)
      Configuration.register_model(Xor,         id: :xor)
      Configuration.register_model(Not,         id: :not)
      Configuration.register_model(Exists,      id: :exists)
      Configuration.register_model(Forall, id: :forall)
      Configuration.register_model(Implies, id: :implies)

      Configuration.register_model(Compose,              id: :compose)
      Configuration.register_model(Domain,               id: :domain)
      Configuration.register_model(Codomain,             id: :codomain)
      Configuration.register_model(Image,                id: :image)
      Configuration.register_model(Ident,                id: :ident)
      Configuration.register_model(Domainofapplication,  id: :domainofapplication)

      Configuration.register_model(Eq, id: :eq)
      Configuration.register_model(Neq,          id: :neq)
      Configuration.register_model(Leq,          id: :leq)
      Configuration.register_model(Lt,           id: :lt)
      Configuration.register_model(Geq,          id: :geq)
      Configuration.register_model(Gt,           id: :gt)
      Configuration.register_model(Equivalent,    id: :equivalent)
      Configuration.register_model(Approx,        id: :approx)
      Configuration.register_model(Factorof,      id: :factorof)

      Configuration.register_model(Set,             id: :set)
      Configuration.register_model(Mlist,           id: :list)
      Configuration.register_model(Union,           id: :union)
      Configuration.register_model(Intersect,       id: :intersect)
      Configuration.register_model(In, id: :in)
      Configuration.register_model(Notin,           id: :notin)
      Configuration.register_model(Subset,          id: :subset)
      Configuration.register_model(Prsubset,        id: :prsubset)
      Configuration.register_model(Notsubset,       id: :notsubset)
      Configuration.register_model(Notprsubset,     id: :notprsubset)
      Configuration.register_model(Setdiff,         id: :setdiff)
      Configuration.register_model(Card,            id: :card)
      Configuration.register_model(Cartesianproduct, id: :cartesianproduct)

      Configuration.register_model(Divergence, id: :divergence)
      Configuration.register_model(Grad, id: :grad)
      Configuration.register_model(Curl, id: :curl)
      Configuration.register_model(Laplacian, id: :laplacian)

      Configuration.register_model(Naturalnumbers, id: :naturalnumbers)
      Configuration.register_model(Primes,          id: :primes)
      Configuration.register_model(Integers,        id: :integers)
      Configuration.register_model(Rationals,       id: :rationals)
      Configuration.register_model(Reals,            id: :reals)
      Configuration.register_model(Complexes,        id: :complexes)
      Configuration.register_model(Emptyset,         id: :emptyset)
      Configuration.register_model(Exponentiale,    id: :exponentiale)
      Configuration.register_model(Imaginaryi,      id: :imaginaryi)
      Configuration.register_model(Pi, id: :pi)
      Configuration.register_model(Eulergamma, id: :eulergamma)
      Configuration.register_model(Mtrue, id: :true) # rubocop:disable Lint/BooleanSymbol
      Configuration.register_model(Mfalse, id: :false) # rubocop:disable Lint/BooleanSymbol
      Configuration.register_model(Infinity,         id: :infinity)
      Configuration.register_model(Notanumber,       id: :notanumber)

      Configuration.register_model(Vector, id: :vector)
      Configuration.register_model(Matrix, id: :matrix)
      Configuration.register_model(Matrixrow,     id: :matrixrow)
      Configuration.register_model(Determinant,   id: :determinant)
      Configuration.register_model(Transpose,     id: :transpose)
      Configuration.register_model(Selector,      id: :selector)
      Configuration.register_model(Vectorproduct,  id: :vectorproduct)
      Configuration.register_model(Scalarproduct,  id: :scalarproduct)
      Configuration.register_model(Outerproduct,   id: :outerproduct)

      Configuration.register_model(Mean,        id: :mean)
      Configuration.register_model(Sdev,        id: :sdev)
      Configuration.register_model(Variance, id: :variance)
      Configuration.register_model(Median, id: :median)
      Configuration.register_model(Mode, id: :mode)
      Configuration.register_model(Moment, id: :moment)
      Configuration.register_model(Momentabout, id: :momentabout)
    end
  end
end
