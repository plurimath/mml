# frozen_string_literal: true

module Mml
  module V3
    class Int < CommonElements
      include Base::Content::Int
    end
    Configuration.register_model(Int, id: :int)

    class Diff < CommonElements
      include Base::Content::Diff
    end
    Configuration.register_model(Diff, id: :diff)

    class Partialdiff < CommonElements
      include Base::Content::Partialdiff
    end
    Configuration.register_model(Partialdiff, id: :partialdiff)

    class Limit < CommonElements
      include Base::Content::Limit
    end
    Configuration.register_model(Limit, id: :limit)

    class Lowlimit < CommonElements
      include Base::Content::Lowlimit
    end
    Configuration.register_model(Lowlimit, id: :lowlimit)

    class Uplimit < CommonElements
      include Base::Content::Uplimit
    end
    Configuration.register_model(Uplimit, id: :uplimit)

    class Tendsto < CommonElements
      include Base::Content::Tendsto
    end
    Configuration.register_model(Tendsto, id: :tendsto)
  end
end
