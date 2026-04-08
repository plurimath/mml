# frozen_string_literal: true

module Mml
  module V3
    class Divergence < Lutaml::Model::Serializable
      include Base::Content::Divergence
    end
    Configuration.register_model(Divergence, id: :divergence)

    class Grad < Lutaml::Model::Serializable
      include Base::Content::Grad
    end
    Configuration.register_model(Grad, id: :grad)

    class Curl < Lutaml::Model::Serializable
      include Base::Content::Curl
    end
    Configuration.register_model(Curl, id: :curl)

    class Laplacian < Lutaml::Model::Serializable
      include Base::Content::Laplacian
    end
    Configuration.register_model(Laplacian, id: :laplacian)
  end
end
