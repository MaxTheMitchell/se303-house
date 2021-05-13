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
    when 3 
      "the rat that ate #{things_around_the_house(2)}"
    when 4 
      "the cat that killed #{things_around_the_house(3)}"
    when 5 
      "the dog that worried #{things_around_the_house(4)}"
    when 6
      "the cow with the crumpled horn that tossed #{things_around_the_house(5)}"
    when 7
      "the maiden all forlorn that milked #{things_around_the_house(6)}"
    when 8 
      "the man all tattered and torn that kissed #{things_around_the_house(7)}"
    when 9 
      "the priest all shaven and shorn that married #{things_around_the_house(8)}"
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
          "the malt that lay in "
        ][number - 1] + things_around_the_house(number - 1)
      end
    end
  end
end
