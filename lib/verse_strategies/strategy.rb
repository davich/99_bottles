module VerseStrategies
  class Strategy
    attr_reader :num
    
    def initialize(num)
      @num = num
    end

    def count
      raise NotImplementedError
    end

    def next_count
      raise NotImplementedError
    end

    def take_it_down
      raise NotImplementedError
    end

    def title_count
      count.capitalize
    end

    def self.components(num)
      strategy = new(num)
      {
        count: strategy.count,
        next_count: strategy.next_count,
        take_it_down: strategy.take_it_down,
        title_count: strategy.title_count,
      }
    end
  end
end
