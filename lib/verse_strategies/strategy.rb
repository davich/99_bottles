module VerseStrategies
  class Strategy
    attr_reader :num

    def initialize(num)
      @num = num
    end

    def self.for(num)
      strategies[num].new(num)
    end

    def self.strategies
      Hash.new(Default).merge(
        0 => NoBottles,
        1 => OneBottle,
      )
    end

    def count
      raise NotImplementedError
    end

    def next_count
      raise NotImplementedError
    end

    def action
      raise NotImplementedError
    end

    def next_count
      Strategy.for(num - 1).count
    end

    def components
      {
        count: count,
        next_count: next_count,
        action: action,
        title_count: count.capitalize,
      }
    end
  end
end
