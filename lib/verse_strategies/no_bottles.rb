module VerseStrategies
  class NoBottles < Strategy
    def take_it_down
      "Go to the store and buy some more"
    end

    def count
      "no more bottles"
    end

    def next_count
      Default.new(99).count
    end
  end
end
