module VerseStrategies
  class OneBottle < Strategy
    def take_it_down
      "Take it down and pass it around"
    end

    def count
      "#{num} bottle"
    end

    def next_count
      NoBottles.new(num).count
    end
  end
end
