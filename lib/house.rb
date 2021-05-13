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
    case number
    when 10 
      "the rooster that crowed in the morn that woke #{things_around_the_house(9)}"
    when 11 
      "the farmer sowing his corn that kept #{things_around_the_house(10)}"
    when 12 
      "the horse and the hound and the horn that belonged to #{things_around_the_house(11)}"
    else 
      if number == 0
        ""
      else 
        [
          "the house that Jack built.\n",
          "the malt that lay in ",
          "the rat that ate ",
          "the cat that killed ",
          "the dog that worried ",
          "the cow with the crumpled horn that tossed ",
          "the maiden all forlorn that milked ",
          "the man all tattered and torn that kissed ",
          "the priest all shaven and shorn that married "
        ][number - 1] + things_around_the_house(number - 1)
      end
    end
  end
end
