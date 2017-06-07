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

    def components
      {
        count: count,
        next_count: next_count,
        take_it_down: take_it_down,
        title_count: title_count,
      }
    end
  end
end
