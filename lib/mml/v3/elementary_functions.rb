# frozen_string_literal: true

module Mml
  module V3
    class Exp < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Exp
    end
    Configuration.register_model(Exp, id: :exp)

    class Ln < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Ln
    end
    Configuration.register_model(Ln, id: :ln)

    class Log < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Log
    end
    Configuration.register_model(Log, id: :log)

    class Logbase < CommonElements
      include Base::Content::Logbase
    end
    Configuration.register_model(Logbase, id: :logbase)

    class Sin < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Sin
    end
    Configuration.register_model(Sin, id: :sin)

    class Cos < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Cos
    end
    Configuration.register_model(Cos, id: :cos)

    class Tan < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Tan
    end
    Configuration.register_model(Tan, id: :tan)

    class Sec < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Sec
    end
    Configuration.register_model(Sec, id: :sec)

    class Csc < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Csc
    end
    Configuration.register_model(Csc, id: :csc)

    class Cot < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Cot
    end
    Configuration.register_model(Cot, id: :cot)

    class Arcsin < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Arcsin
    end
    Configuration.register_model(Arcsin, id: :arcsin)

    class Arccos < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Arccos
    end
    Configuration.register_model(Arccos, id: :arccos)

    class Arctan < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Arctan
    end
    Configuration.register_model(Arctan, id: :arctan)

    class Arccot < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Arccot
    end
    Configuration.register_model(Arccot, id: :arccot)

    class Arccsc < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Arccsc
    end
    Configuration.register_model(Arccsc, id: :arccsc)

    class Arcsec < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Arcsec
    end
    Configuration.register_model(Arcsec, id: :arcsec)

    class Sinh < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Sinh
    end
    Configuration.register_model(Sinh, id: :sinh)

    class Cosh < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Cosh
    end
    Configuration.register_model(Cosh, id: :cosh)

    class Tanh < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Tanh
    end
    Configuration.register_model(Tanh, id: :tanh)

    class Sech < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Sech
    end
    Configuration.register_model(Sech, id: :sech)

    class Csch < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Csch
    end
    Configuration.register_model(Csch, id: :csch)

    class Coth < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Coth
    end
    Configuration.register_model(Coth, id: :coth)

    class Arcsinh < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Arcsinh
    end
    Configuration.register_model(Arcsinh, id: :arcsinh)

    class Arccosh < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Arccosh
    end
    Configuration.register_model(Arccosh, id: :arccosh)

    class Arctanh < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Arctanh
    end
    Configuration.register_model(Arctanh, id: :arctanh)

    class Arccoth < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Arccoth
    end
    Configuration.register_model(Arccoth, id: :arccoth)

    class Arccsch < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Arccsch
    end
    Configuration.register_model(Arccsch, id: :arccsch)

    class Arcsech < Lutaml::Model::Serializable
      def self.lutaml_default_register
        :mml_v3
      end

      include Base::Content::Arcsech
    end
    Configuration.register_model(Arcsech, id: :arcsech)
  end
end
