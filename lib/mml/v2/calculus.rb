# frozen_string_literal: true

module Mml
  module V2
    class Int < CommonElements
      include Base::Content::Int
    end

    class Diff < CommonElements
      include Base::Content::Diff
    end

    class Partialdiff < CommonElements
      include Base::Content::Partialdiff
    end

    class Limit < CommonElements
      include Base::Content::Limit
    end

    class Lowlimit < CommonElements
      include Base::Content::Lowlimit
    end

    class Uplimit < CommonElements
      include Base::Content::Uplimit
    end

    class Tendsto < CommonElements
      include Base::Content::Tendsto
    end
  end
end
