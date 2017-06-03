class Bottles
  def song
    verses(99, 0)
  end

  def verses(start_verse, end_verse)
    start_verse.downto(end_verse).map do |num|
      verse(num)
    end.join("\n")
  end

  FORMAT_STRING = <<-EOF
%{title_count} of beer on the wall, %{count} of beer.
%{take_it_down}, %{next_count} of beer on the wall.
EOF

  def verse(num)
    FORMAT_STRING % bottle_instance(num).components
  end

  private

  def bottle_instance(num)
    case num
    when 0 ; NoBottles
    when 1 ; OneBottle
    else ; MultipleBottles
    end.new(num)
  end

  class Bottle
    def initialize(num)
      @num = num
    end
    attr_reader :num

    def title_count
      count.capitalize
    end

    def next_count
      count((num-1) % 100)
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

  class NoBottles < Bottle
    def take_it_down
      "Go to the store and buy some more"
    end

    def count
      "no more bottles"
    end

    def next_count
      MultipleBottles.new(99).count
    end
  end

  class OneBottle < Bottle
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

  class MultipleBottles < Bottle
    def take_it_down
      "Take one down and pass it around"
    end

    def count(x = num)
      "#{x} bottles"
    end

    def next_count
      if num == 2
        OneBottle.new(1).count
      else
        count(num - 1)
      end
    end
  end
end
