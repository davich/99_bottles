module VerseStrategies
  class NoBottles < Strategy
    def action
      "Go to the store and buy some more"
    end

    def count
      "no more bottles"
    end

    def next_count
      Strategy.for(99).count
    end
  end
end
