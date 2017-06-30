require_relative 'verse_strategies/strategy.rb'
require_relative 'verse_strategies/no_bottles.rb'
require_relative 'verse_strategies/one_bottle.rb'
require_relative 'verse_strategies/default.rb'

class Bottles
  def song
    verses(99, 0)
  end

  def verses(high, low)
    high.downto(low).map {|num| verse(num) }.join("\n")
  end

  def verse(num)
    FORMAT_STRING % VerseStrategies::Strategy.for(num).components
  end

  FORMAT_STRING = <<-EOF
%{title_count} of beer on the wall, %{count} of beer.
%{action}, %{next_count} of beer on the wall.
EOF
end
