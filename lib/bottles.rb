class Bottles
  ONE_TEXT = <<-EOF
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
EOF
  ZERO_TEXT = <<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
VERSE

  def song
    verses(99, 0)
  end

  def verses(start_verse, end_verse)
    start_verse.downto(end_verse).map {|num| verse(num) }.join("\n")
  end

  def verse(num)
    return ZERO_TEXT if num == 0
    return ONE_TEXT if num == 1

    <<-EOF
#{num} bottles of beer on the wall, #{num} bottles of beer.
Take one down and pass it around, #{bottles(num-1)} of beer on the wall.
EOF
  end

  private

  def bottles(num)
    num == 1 ? "#{num} bottle" : "#{num} bottles"
  end
end
