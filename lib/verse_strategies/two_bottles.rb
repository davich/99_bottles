module VerseStrategies
  class TwoBottles < Strategy
    def take_it_down
      "Take one down and pass it around"
    end

    def count(x = num)
      "#{x} bottles"
    end

    def next_count
      OneBottle.new(1).count
    end
  end
end
