class Bottles
  def verse(bottles)
    return <<-VERSE
#{no_bottles(bottles, true)} #{pluralize_bottles(bottles)} of beer on the wall, #{no_bottles(bottles)} #{pluralize_bottles(bottles)} of beer.
#{line_two(bottles)}
VERSE
  end

  def verses(start, finish)
    args_range = (finish..start).to_a.reverse

    args_range.map{ |arg| verse(arg) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private
  def line_two(bottles)

    if bottles > 0
      "Take #{pluralize_one(bottles)} down and pass it around, #{remaining_bottles(bottles)} #{pluralize_bottles(remaining_bottles(bottles))} of beer on the wall."
    else
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    end
  end
  def no_bottles(bottles, sentense_case=false)
    bottles > 0 ? bottles  : (sentense_case ? 'No more' : 'no more')
  end

  def remaining_bottles(bottles)
    bottles > 1 ? bottles - 1 : 'no more'
  end

  def pluralize_bottles(bottles)
    (bottles.is_a?(String) || bottles != 1) ? 'bottles' : 'bottle'
  end

  def pluralize_one(bottles)
    bottles > 1 ? 'one' : 'it'
  end
end

