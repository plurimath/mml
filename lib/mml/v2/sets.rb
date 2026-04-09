# frozen_string_literal: true

module Mml
  module V2
    class Set < CommonElements
      include Base::Content::Set
    end

    class Mlist < CommonElements
      include Base::Content::List
    end

    class Union < CommonElements
      include Base::Content::Union
    end

    class Intersect < CommonElements
      include Base::Content::Intersect
    end

    class In < CommonElements
      include Base::Content::In
    end

    class Notin < CommonElements
      include Base::Content::Notin
    end

    class Subset < CommonElements
      include Base::Content::Subset
    end

    class Prsubset < CommonElements
      include Base::Content::Prsubset
    end

    class Notsubset < CommonElements
      include Base::Content::Notsubset
    end

    class Notprsubset < CommonElements
      include Base::Content::Notprsubset
    end

    class Setdiff < CommonElements
      include Base::Content::Setdiff
    end

    class Card < CommonElements
      include Base::Content::Card
    end

    class Cartesianproduct < CommonElements
      include Base::Content::Cartesianproduct
    end
  end
end
