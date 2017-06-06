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
        title_count: title_count,
        count: count,
        take_it_down: take_it_down,
        next_count: next_count
      }
    end
  end
end
