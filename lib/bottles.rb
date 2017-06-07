require_relative 'verse_strategies/strategy.rb'
require_relative 'verse_strategies/no_bottles.rb'
require_relative 'verse_strategies/one_bottle.rb'
require_relative 'verse_strategies/two_bottles.rb'
require_relative 'verse_strategies/default.rb'

class Bottles
  def song
    verses(99, 0)
  end

  def verses(start_verse, end_verse)
    start_verse.downto(end_verse).map {|num| verse(num) }.join("\n")
  end

  def verse(num)
    FORMAT_STRING % verse_components(num)
  end

  private

  def verse_components(num)
    STRATEGIES[num].new(num).components
  end

  FORMAT_STRING = <<-EOF
%{title_count} of beer on the wall, %{count} of beer.
%{take_it_down}, %{next_count} of beer on the wall.
EOF

  STRATEGIES = Hash.new(VerseStrategies::Default).merge(
    0 => VerseStrategies::NoBottles,
    1 => VerseStrategies::OneBottle,
    2 => VerseStrategies::TwoBottles,
  )
end
