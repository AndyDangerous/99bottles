class Bottles

  def verse(bottles)
    @bottles_left = bottles - 1
    @bottles = bottles
    <<-LYRICS
#{capital_bottles_as_word} #{bottle_or_bottles} of beer on the wall, #{bottles_as_word} #{bottle_or_bottles} of beer.
#{do_the_thing}, #{bottles_as_word} #{bottle_or_bottles} of beer on the wall.
    LYRICS
  end

  def verses(first, last)
    things = (last..first)

    things.map{|v| verse(v.to_i)}.reverse.join("\n")
  end

  def song
    verses(99, 0)
  end

  def capital_bottles_as_word
    if bottles_as_word.is_a? String
      bottles_as_word.capitalize
    else
      bottles_as_word
    end
  end

  def bottle_or_bottles
    if @bottles == 1
      "bottle"
    else
      "bottles"
    end
  end

  def bottles_as_word
    if @bottles == 0
      "no more"
    else
      @bottles
    end
  end

  def do_the_thing
    if @bottles > 0
      str = "Take #{it_or_one} down and pass it around"
      @bottles -= 1
      str
    else
      @bottles = 99
      "Go to the store and buy some more"
    end
  end

  def it_or_one
    if @bottles == 1
      "it"
    else
      "one"
    end
  end
end
