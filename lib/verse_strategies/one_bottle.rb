module VerseStrategies
  class OneBottle < Strategy
    def take_it_down
      "Take it down and pass it around"
    end

    def count
      "1 bottle"
    end

    def next_count
      NoBottles.new(0).count
    end
  end
end
