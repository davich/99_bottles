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
    start_verse.downto(end_verse).map do |num|
      verse(num)
    end.join("\n")
  end

  FORMAT_STRING = <<-EOF
%{title_count} of beer on the wall, %{count} of beer.
%{take_it_down}, %{next_count} of beer on the wall.
EOF

  def verse(num)
    FORMAT_STRING % strategy_instance(num).components
  end

  private

  def strategy_instance(num)
    case num
    when 0 ; VerseStrategies::NoBottles
    when 1 ; VerseStrategies::OneBottle
    when 2 ; VerseStrategies::TwoBottles
    else ; VerseStrategies::Default
    end.new(num)
  end
end
