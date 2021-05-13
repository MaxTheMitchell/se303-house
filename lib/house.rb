class House
  def initialize
  end

  def recite
    (1..12).map { |i| line(i) }.join("\n")
  end

  def line(number)
    "This is #{things_around_the_house(number)}"
  end

  private

  def things_around_the_house(number)
    [
      "the house that Jack built.\n",
      "the malt that lay in ",
      "the rat that ate ",
      "the cat that killed ",
      "the dog that worried ",
      "the cow with the crumpled horn that tossed ",
      "the maiden all forlorn that milked ",
      "the man all tattered and torn that kissed ",
      "the priest all shaven and shorn that married ",
      "the rooster that crowed in the morn that woke ",
      "the farmer sowing his corn that kept ",
      "the horse and the hound and the horn that belonged to "
    ][0...number].reverse.join("")
  end
end
