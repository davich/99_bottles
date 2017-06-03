module VerseStrategies
  class Default < Strategy
    def take_it_down
      "Take one down and pass it around"
    end

    def count
      "#{num} bottles"
    end

    def next_count
      self.class.new(num - 1).count
    end
  end
end
