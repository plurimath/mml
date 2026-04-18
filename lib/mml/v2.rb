# frozen_string_literal: true

require "lutaml/model"
require_relative "versioned_parser"

require_relative "v2/configuration"
require_relative "v2/namespace"
require_relative "v2/common_elements"

# Eagerly load all element files (required for Configuration.register_model)
require_relative "v2/maction"
require_relative "v2/maligngroup"
require_relative "v2/malignmark"
require_relative "v2/menclose"
require_relative "v2/merror"
require_relative "v2/mfenced"
require_relative "v2/mfrac"
require_relative "v2/mfraction"
require_relative "v2/mglyph"
require_relative "v2/mi"
require_relative "v2/mlabeledtr"
require_relative "v2/mlongdiv"
require_relative "v2/mmultiscripts"
require_relative "v2/mn"
require_relative "v2/mo"
require_relative "v2/mover"
require_relative "v2/mpadded"
require_relative "v2/mphantom"
require_relative "v2/mprescripts"
require_relative "v2/mroot"
require_relative "v2/mrow"
require_relative "v2/ms"
require_relative "v2/mscarries"
require_relative "v2/mscarry"
require_relative "v2/msgroup"
require_relative "v2/msline"
require_relative "v2/mspace"
require_relative "v2/msqrt"
require_relative "v2/msrow"
require_relative "v2/mstack"
require_relative "v2/mstyle"
require_relative "v2/msub"
require_relative "v2/msubsup"
require_relative "v2/msup"
require_relative "v2/mtable"
require_relative "v2/mtd"
require_relative "v2/mtext"
require_relative "v2/mtr"
require_relative "v2/munder"
require_relative "v2/munderover"
require_relative "v2/none"
require_relative "v2/semantics"
require_relative "v2/math"

# Content elements - separate files
require_relative "v2/annotation"
require_relative "v2/annotation_xml"
require_relative "v2/apply"
require_relative "v2/bvar"
require_relative "v2/bind"
require_relative "v2/ci"
require_relative "v2/cn"
require_relative "v2/condition"
require_relative "v2/csymbol"
require_relative "v2/degree"
require_relative "v2/fn"
require_relative "v2/interval"
require_relative "v2/inverse"
require_relative "v2/lambda"
require_relative "v2/otherwise"
require_relative "v2/piece"
require_relative "v2/piecewise"
require_relative "v2/reln"
require_relative "v2/sep"

# Content elements - batch files
require_relative "v2/arith"
require_relative "v2/calculus"
require_relative "v2/constants"
require_relative "v2/elementary_functions"
require_relative "v2/functions"
require_relative "v2/linear_algebra"
require_relative "v2/logic"
require_relative "v2/relations"
require_relative "v2/sets"
require_relative "v2/statistics"
require_relative "v2/vector_calculus"

module Mml
  module V2
    extend Mml::VersionedParser

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
    # Arith (Abs, Conjugate, Arg, Real, Imaginary, Floor, Ceiling, Quotient, Divide, Rem, Minus, Plus, Times, Power, Root, Max, Min, Gcd, Lcm, Sum, Product, Factorial)
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

    # Calculus (Int, Diff, Partialdiff, Limit, Lowlimit, Uplimit, Tendsto)
    Configuration.register_model(Int,          id: :int)
    Configuration.register_model(Diff,         id: :diff)
    Configuration.register_model(Partialdiff,  id: :partialdiff)
    Configuration.register_model(Limit, id: :limit)
    Configuration.register_model(Lowlimit,     id: :lowlimit)
    Configuration.register_model(Uplimit,      id: :uplimit)
    Configuration.register_model(Tendsto,      id: :tendsto)

    # ElementaryFunctions (Exp, Ln, Log, Logbase, trig, hyperbolic, inverse)
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

    # Logic (And, Or, Xor, Not, Exists, Forall, Implies)
    Configuration.register_model(And,         id: :and)
    Configuration.register_model(Or,          id: :or)
    Configuration.register_model(Xor,         id: :xor)
    Configuration.register_model(Not,         id: :not)
    Configuration.register_model(Exists,      id: :exists)
    Configuration.register_model(Forall, id: :forall)
    Configuration.register_model(Implies, id: :implies)

    # Functions (Compose, Domain, Codomain, Image, Ident, Domainofapplication)
    Configuration.register_model(Compose,              id: :compose)
    Configuration.register_model(Domain,               id: :domain)
    Configuration.register_model(Codomain,             id: :codomain)
    Configuration.register_model(Image,                id: :image)
    Configuration.register_model(Ident,                id: :ident)
    Configuration.register_model(Domainofapplication,  id: :domainofapplication)

    # Relations (Eq, Neq, Leq, Lt, Geq, Gt, Equivalent, Approx, Factorof)
    Configuration.register_model(Eq, id: :eq)
    Configuration.register_model(Neq,          id: :neq)
    Configuration.register_model(Leq,          id: :leq)
    Configuration.register_model(Lt,           id: :lt)
    Configuration.register_model(Geq,          id: :geq)
    Configuration.register_model(Gt,           id: :gt)
    Configuration.register_model(Equivalent,    id: :equivalent)
    Configuration.register_model(Approx,        id: :approx)
    Configuration.register_model(Factorof,      id: :factorof)

    # Sets (Set, Mlist, Union, Intersect, In, Notin, Subset, Prsubset, Notsubset, Notprsubset, Setdiff, Card, Cartesianproduct)
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

    # VectorCalculus (Divergence, Grad, Curl, Laplacian)
    Configuration.register_model(Divergence, id: :divergence)
    Configuration.register_model(Grad, id: :grad)
    Configuration.register_model(Curl, id: :curl)
    Configuration.register_model(Laplacian, id: :laplacian)

    # Constants (Naturalnumbers, Primes, Integers, Rationals, Reals, Complexes, Emptyset, Exponentiale, Imaginaryi, Pi, Eulergamma, Mtrue, Mfalse, Infinity, Notanumber)
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

    # LinearAlgebra (Vector, Matrix, Matrixrow, Determinant, Transpose, Selector, Vectorproduct, Scalarproduct, Outerproduct)
    Configuration.register_model(Vector, id: :vector)
    Configuration.register_model(Matrix, id: :matrix)
    Configuration.register_model(Matrixrow,     id: :matrixrow)
    Configuration.register_model(Determinant,   id: :determinant)
    Configuration.register_model(Transpose,     id: :transpose)
    Configuration.register_model(Selector,      id: :selector)
    Configuration.register_model(Vectorproduct,  id: :vectorproduct)
    Configuration.register_model(Scalarproduct,  id: :scalarproduct)
    Configuration.register_model(Outerproduct,   id: :outerproduct)

    # Statistics (Mean, Sdev, Variance, Median, Mode, Moment, Momentabout)
    Configuration.register_model(Mean,        id: :mean)
    Configuration.register_model(Sdev,        id: :sdev)
    Configuration.register_model(Variance, id: :variance)
    Configuration.register_model(Median, id: :median)
    Configuration.register_model(Mode, id: :mode)
    Configuration.register_model(Moment, id: :moment)
    Configuration.register_model(Momentabout, id: :momentabout)
  end
end
