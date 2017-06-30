module VerseStrategies
  class Default < Strategy
    def action
      "Take one down and pass it around"
    end

    def count
      "#{num} bottles"
    end
  end
end
