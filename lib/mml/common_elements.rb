# frozen_string_literal: true

require "lutaml/model"

module Mml
  class CommonElements < Lutaml::Model::Serializable
    # Presentation elements
    attribute :mmultiscripts_value, :mmultiscripts, collection: true
    attribute :maligngroup_value, :maligngroup, collection: true
    attribute :malignmark_value, :malignmark, collection: true
    attribute :munderover_value, :munderover, collection: true
    attribute :semantics_value, :semantics, collection: true
    attribute :mscarries_value, :mscarries, collection: true
    attribute :mfraction_value, :mfraction, collection: true
    attribute :mphantom_value, :mphantom, collection: true
    attribute :menclose_value, :menclose, collection: true
    attribute :mlongdiv_value, :mlongdiv, collection: true
    attribute :mpadded_value, :mpadded, collection: true
    attribute :msubsup_value, :msubsup, collection: true
    attribute :mscarry_value, :mscarry, collection: true
    attribute :mfenced_value, :mfenced, collection: true
    attribute :msgroup_value, :msgroup, collection: true
    attribute :mglyph_value, :mglyph, collection: true
    attribute :mstack_value, :mstack, collection: true
    attribute :munder_value, :munder, collection: true
    attribute :mtable_value, :mtable, collection: true
    attribute :mstyle_value, :mstyle, collection: true
    attribute :mspace_value, :mspace, collection: true
    attribute :msline_value, :msline, collection: true
    attribute :merror_value, :merror, collection: true
    attribute :msrow_value, :msrow, collection: true
    attribute :mfrac_value, :mfrac, collection: true
    attribute :mover_value, :mover, collection: true
    attribute :mroot_value, :mroot, collection: true
    attribute :mtext_value, :mtext, collection: true
    attribute :msqrt_value, :msqrt, collection: true
    attribute :none_value, :none, collection: true
    attribute :mrow_value, :mrow, collection: true
    attribute :msub_value, :msub, collection: true
    attribute :msup_value, :msup, collection: true
    attribute :mi_value, :mi, collection: true
    attribute :mo_value, :mo, collection: true
    attribute :mn_value, :mn, collection: true
    attribute :ms_value, :ms, collection: true
    attribute :maction_value, :maction, collection: true

    # Content elements - containers
    attribute :apply_value, :apply, collection: true
    attribute :ci_value, :ci, collection: true
    attribute :cn_value, :cn, collection: true
    attribute :csymbol_value, :csymbol, collection: true
    attribute :annotation_xml_value, :"annotation-xml", collection: true

    # Content elements - constructs
    attribute :bind_value, :bind, collection: true
    attribute :bvar_value, :bvar, collection: true
    attribute :condition_value, :condition, collection: true
    attribute :interval_value, :interval, collection: true
    attribute :lambda_value, :lambda, collection: true
    attribute :inverse_value, :inverse, collection: true
    attribute :degree_value, :degree, collection: true
    attribute :piecewise_value, :piecewise, collection: true
    attribute :piece_value, :piece, collection: true
    attribute :otherwise_value, :otherwise, collection: true
    attribute :sep_value, :sep, collection: true

    # Content elements - arithmetic
    attribute :abs_value, :abs, collection: true
    attribute :conjugate_value, :conjugate, collection: true
    attribute :arg_value, :arg, collection: true
    attribute :real_value, :real, collection: true
    attribute :imaginary_value, :imaginary, collection: true
    attribute :floor_value, :floor, collection: true
    attribute :ceiling_value, :ceiling, collection: true
    attribute :quotient_value, :quotient, collection: true
    attribute :divide_value, :divide, collection: true
    attribute :rem_value, :rem, collection: true
    attribute :minus_value, :minus, collection: true
    attribute :plus_value, :plus, collection: true
    attribute :times_value, :times, collection: true
    attribute :power_value, :power, collection: true
    attribute :root_value, :root, collection: true
    attribute :max_value, :max, collection: true
    attribute :min_value, :min, collection: true
    attribute :gcd_value, :gcd, collection: true
    attribute :lcm_value, :lcm, collection: true
    attribute :sum_value, :sum, collection: true
    attribute :product_value, :product, collection: true
    attribute :factorial_value, :factorial, collection: true

    # Content elements - logic
    attribute :and_value, :and, collection: true
    attribute :or_value, :or, collection: true
    attribute :xor_value, :xor, collection: true
    attribute :not_value, :not, collection: true
    attribute :implies_value, :implies, collection: true
    attribute :forall_value, :forall, collection: true
    attribute :exists_value, :exists, collection: true

    # Content elements - relations
    attribute :eq_value, :eq, collection: true
    attribute :neq_value, :neq, collection: true
    attribute :lt_value, :lt, collection: true
    attribute :gt_value, :gt, collection: true
    attribute :leq_value, :leq, collection: true
    attribute :geq_value, :geq, collection: true
    attribute :equivalent_value, :equivalent, collection: true
    attribute :approx_value, :approx, collection: true

    # Content elements - sets
    attribute :set_value, :set, collection: true
    attribute :list_value, :list, collection: true
    attribute :union_value, :union, collection: true
    attribute :intersect_value, :intersect, collection: true
    attribute :in_value, :in, collection: true
    attribute :notin_value, :notin, collection: true
    attribute :notsubset_value, :notsubset, collection: true
    attribute :notprsubset_value, :notprsubset, collection: true
    attribute :subset_value, :subset, collection: true
    attribute :prsubset_value, :prsubset, collection: true
    attribute :setdiff_value, :setdiff, collection: true
    attribute :card_value, :card, collection: true
    attribute :cartesianproduct_value, :cartesianproduct, collection: true

    # Content elements - calculus
    attribute :diff_value, :diff, collection: true
    attribute :partialdiff_value, :partialdiff, collection: true
    attribute :int_value, :int, collection: true
    attribute :lowlimit_value, :lowlimit, collection: true
    attribute :uplimit_value, :uplimit, collection: true

    # Content elements - vector calculus
    attribute :divergence_value, :divergence, collection: true
    attribute :grad_value, :grad, collection: true
    attribute :curl_value, :curl, collection: true
    attribute :laplacian_value, :laplacian, collection: true

    # Content elements - functions
    attribute :compose_value, :compose, collection: true
    attribute :domain_value, :domain, collection: true
    attribute :codomain_value, :codomain, collection: true
    attribute :image_value, :image, collection: true
    attribute :ident_value, :ident, collection: true

    # Content elements - elementary functions
    attribute :sin_value, :sin, collection: true
    attribute :cos_value, :cos, collection: true
    attribute :tan_value, :tan, collection: true
    attribute :sec_value, :sec, collection: true
    attribute :csc_value, :csc, collection: true
    attribute :cot_value, :cot, collection: true
    attribute :sinh_value, :sinh, collection: true
    attribute :cosh_value, :cosh, collection: true
    attribute :tanh_value, :tanh, collection: true
    attribute :sech_value, :sech, collection: true
    attribute :csch_value, :csch, collection: true
    attribute :coth_value, :coth, collection: true
    attribute :arcsin_value, :arcsin, collection: true
    attribute :arccos_value, :arccos, collection: true
    attribute :arctan_value, :arctan, collection: true
    attribute :arcsec_value, :arcsec, collection: true
    attribute :arccsc_value, :arccsc, collection: true
    attribute :arccot_value, :arccot, collection: true
    attribute :arcsinh_value, :arcsinh, collection: true
    attribute :arccosh_value, :arccosh, collection: true
    attribute :arctanh_value, :arctanh, collection: true
    attribute :arcsech_value, :arcsech, collection: true
    attribute :arccsch_value, :arccsch, collection: true
    attribute :arccoth_value, :arccoth, collection: true
    attribute :exp_value, :exp, collection: true
    attribute :ln_value, :ln, collection: true
    attribute :log_value, :log, collection: true

    # Content elements - constants
    attribute :integers_value, :integers, collection: true
    attribute :reals_value, :reals, collection: true
    attribute :rationals_value, :rationals, collection: true
    attribute :naturalnumbers_value, :naturalnumbers, collection: true
    attribute :complexes_value, :complexes, collection: true
    attribute :primes_value, :primes, collection: true
    attribute :exponentiale_value, :exponentiale, collection: true
    attribute :imaginaryi_value, :imaginaryi, collection: true
    attribute :notanumber_value, :notanumber, collection: true
    attribute :true_value, :true, collection: true # rubocop:disable Lint/BooleanSymbol
    attribute :false_value, :false, collection: true # rubocop:disable Lint/BooleanSymbol
    attribute :emptyset_value, :emptyset, collection: true
    attribute :pi_value, :pi, collection: true
    attribute :eulergamma_value, :eulergamma, collection: true
    attribute :infinity_value, :infinity, collection: true

    # Content elements - linear algebra
    attribute :vector_value, :vector, collection: true
    attribute :matrix_value, :matrix, collection: true
    attribute :matrixrow_value, :matrixrow, collection: true
    attribute :determinant_value, :determinant, collection: true
    attribute :transpose_value, :transpose, collection: true
    attribute :selector_value, :selector, collection: true
    attribute :vectorproduct_value, :vectorproduct, collection: true
    attribute :scalarproduct_value, :scalarproduct, collection: true
    attribute :outerproduct_value, :outerproduct, collection: true

    # Content elements - statistics
    attribute :mean_value, :mean, collection: true
    attribute :sdev_value, :sdev, collection: true
    attribute :variance_value, :variance, collection: true
    attribute :median_value, :median, collection: true
    attribute :mode_value, :mode, collection: true
    attribute :moment_value, :moment, collection: true
    attribute :momentabout_value, :momentabout, collection: true

    # rubocop:disable Metrics/BlockLength
    xml do
      # Presentation elements
      map_element "mmultiscripts", to: :mmultiscripts_value
      map_element "maligngroup", to: :maligngroup_value
      map_element "malignmark", to: :malignmark_value
      map_element "munderover", to: :munderover_value
      map_element "semantics", to: :semantics_value
      map_element "mscarries", to: :mscarries_value
      map_element "mfraction", to: :mfraction_value
      map_element "mphantom", to: :mphantom_value
      map_element "menclose", to: :menclose_value
      map_element "mlongdiv", to: :mlongdiv_value
      map_element "mpadded", to: :mpadded_value
      map_element "msubsup", to: :msubsup_value
      map_element "mscarry", to: :mscarry_value
      map_element "mfenced", to: :mfenced_value
      map_element "msgroup", to: :msgroup_value
      map_element "mglyph", to: :mglyph_value
      map_element "mstack", to: :mstack_value
      map_element "munder", to: :munder_value
      map_element "mtable", to: :mtable_value
      map_element "mstyle", to: :mstyle_value
      map_element "mspace", to: :mspace_value
      map_element "msline", to: :msline_value
      map_element "merror", to: :merror_value
      map_element "msrow", to: :msrow_value
      map_element "mfrac", to: :mfrac_value
      map_element "mover", to: :mover_value
      map_element "mroot", to: :mroot_value
      map_element "mtext", to: :mtext_value
      map_element "msqrt", to: :msqrt_value
      map_element "none", to: :none_value
      map_element "mrow", to: :mrow_value
      map_element "msub", to: :msub_value
      map_element "msup", to: :msup_value
      map_element "mi", to: :mi_value
      map_element "mo", to: :mo_value
      map_element "mn", to: :mn_value
      map_element "ms", to: :ms_value
      map_element "maction", to: :maction_value

      # Content elements - containers
      map_element "apply", to: :apply_value
      map_element "ci", to: :ci_value
      map_element "cn", to: :cn_value
      map_element "csymbol", to: :csymbol_value
      map_element "annotation-xml", to: :annotation_xml_value

      # Content elements - constructs
      map_element "bind", to: :bind_value
      map_element "bvar", to: :bvar_value
      map_element "condition", to: :condition_value
      map_element "interval", to: :interval_value
      map_element "lambda", to: :lambda_value
      map_element "inverse", to: :inverse_value
      map_element "degree", to: :degree_value
      map_element "piecewise", to: :piecewise_value
      map_element "piece", to: :piece_value
      map_element "otherwise", to: :otherwise_value
      map_element "sep", to: :sep_value

      # Content elements - arithmetic
      map_element "abs", to: :abs_value
      map_element "conjugate", to: :conjugate_value
      map_element "arg", to: :arg_value
      map_element "real", to: :real_value
      map_element "imaginary", to: :imaginary_value
      map_element "floor", to: :floor_value
      map_element "ceiling", to: :ceiling_value
      map_element "quotient", to: :quotient_value
      map_element "divide", to: :divide_value
      map_element "rem", to: :rem_value
      map_element "minus", to: :minus_value
      map_element "plus", to: :plus_value
      map_element "times", to: :times_value
      map_element "power", to: :power_value
      map_element "root", to: :root_value
      map_element "max", to: :max_value
      map_element "min", to: :min_value
      map_element "gcd", to: :gcd_value
      map_element "lcm", to: :lcm_value
      map_element "sum", to: :sum_value
      map_element "product", to: :product_value
      map_element "factorial", to: :factorial_value

      # Content elements - logic
      map_element "and", to: :and_value
      map_element "or", to: :or_value
      map_element "xor", to: :xor_value
      map_element "not", to: :not_value
      map_element "implies", to: :implies_value
      map_element "forall", to: :forall_value
      map_element "exists", to: :exists_value

      # Content elements - relations
      map_element "eq", to: :eq_value
      map_element "neq", to: :neq_value
      map_element "lt", to: :lt_value
      map_element "gt", to: :gt_value
      map_element "leq", to: :leq_value
      map_element "geq", to: :geq_value
      map_element "equivalent", to: :equivalent_value
      map_element "approx", to: :approx_value

      # Content elements - sets
      map_element "set", to: :set_value
      map_element "list", to: :list_value
      map_element "union", to: :union_value
      map_element "intersect", to: :intersect_value
      map_element "in", to: :in_value
      map_element "notin", to: :notin_value
      map_element "notsubset", to: :notsubset_value
      map_element "notprsubset", to: :notprsubset_value
      map_element "subset", to: :subset_value
      map_element "prsubset", to: :prsubset_value
      map_element "setdiff", to: :setdiff_value
      map_element "card", to: :card_value
      map_element "cartesianproduct", to: :cartesianproduct_value

      # Content elements - calculus
      map_element "diff", to: :diff_value
      map_element "partialdiff", to: :partialdiff_value
      map_element "int", to: :int_value
      map_element "lowlimit", to: :lowlimit_value
      map_element "uplimit", to: :uplimit_value

      # Content elements - vector calculus
      map_element "divergence", to: :divergence_value
      map_element "grad", to: :grad_value
      map_element "curl", to: :curl_value
      map_element "laplacian", to: :laplacian_value

      # Content elements - functions
      map_element "compose", to: :compose_value
      map_element "domain", to: :domain_value
      map_element "codomain", to: :codomain_value
      map_element "image", to: :image_value
      map_element "ident", to: :ident_value

      # Content elements - elementary functions
      map_element "sin", to: :sin_value
      map_element "cos", to: :cos_value
      map_element "tan", to: :tan_value
      map_element "sec", to: :sec_value
      map_element "csc", to: :csc_value
      map_element "cot", to: :cot_value
      map_element "sinh", to: :sinh_value
      map_element "cosh", to: :cosh_value
      map_element "tanh", to: :tanh_value
      map_element "sech", to: :sech_value
      map_element "csch", to: :csch_value
      map_element "coth", to: :coth_value
      map_element "arcsin", to: :arcsin_value
      map_element "arccos", to: :arccos_value
      map_element "arctan", to: :arctan_value
      map_element "arcsec", to: :arcsec_value
      map_element "arccsc", to: :arccsc_value
      map_element "arccot", to: :arccot_value
      map_element "arcsinh", to: :arcsinh_value
      map_element "arccosh", to: :arccosh_value
      map_element "arctanh", to: :arctanh_value
      map_element "arcsech", to: :arcsech_value
      map_element "arccsch", to: :arccsch_value
      map_element "arccoth", to: :arccoth_value
      map_element "exp", to: :exp_value
      map_element "ln", to: :ln_value
      map_element "log", to: :log_value

      # Content elements - constants
      map_element "integers", to: :integers_value
      map_element "reals", to: :reals_value
      map_element "rationals", to: :rationals_value
      map_element "naturalnumbers", to: :naturalnumbers_value
      map_element "complexes", to: :complexes_value
      map_element "primes", to: :primes_value
      map_element "exponentiale", to: :exponentiale_value
      map_element "imaginaryi", to: :imaginaryi_value
      map_element "notanumber", to: :notanumber_value
      map_element "true", to: :true_value
      map_element "false", to: :false_value
      map_element "emptyset", to: :emptyset_value
      map_element "pi", to: :pi_value
      map_element "eulergamma", to: :eulergamma_value
      map_element "infinity", to: :infinity_value

      # Content elements - linear algebra
      map_element "vector", to: :vector_value
      map_element "matrix", to: :matrix_value
      map_element "matrixrow", to: :matrixrow_value
      map_element "determinant", to: :determinant_value
      map_element "transpose", to: :transpose_value
      map_element "selector", to: :selector_value
      map_element "vectorproduct", to: :vectorproduct_value
      map_element "scalarproduct", to: :scalarproduct_value
      map_element "outerproduct", to: :outerproduct_value

      # Content elements - statistics
      map_element "mean", to: :mean_value
      map_element "sdev", to: :sdev_value
      map_element "variance", to: :variance_value
      map_element "median", to: :median_value
      map_element "mode", to: :mode_value
      map_element "moment", to: :moment_value
      map_element "momentabout", to: :momentabout_value
    end
    # rubocop:enable Metrics/BlockLength
  end
end
