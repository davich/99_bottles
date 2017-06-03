module VerseStrategies
  class Strategy
    def initialize(num)
      @num = num
    end
    attr_reader :num

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