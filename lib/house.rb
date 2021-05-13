class House
  def initialize
  end

  def recite
    (1..12).map { |i| line(i) }.join("\n")
  end

  def line(number)
    "This is #{before_the_house(number)}the house that Jack built.\n"
  end

  private

  def before_the_house(number)
    case number
    when 1
      ""
    when 2
      "the malt that lay in "
    when 3 
      "the rat that ate #{before_the_house(2)}"
    when 4 
      "the cat that killed #{before_the_house(3)}"
    when 5 
      "the dog that worried #{before_the_house(4)}"
    when 6
      "the cow with the crumpled horn that tossed #{before_the_house(5)}"
    when 7
      "the maiden all forlorn that milked #{before_the_house(6)}"
    when 8 
      "the man all tattered and torn that kissed #{before_the_house(7)}"
    when 9 
      "the priest all shaven and shorn that married #{before_the_house(8)}"
    when 10 
      "the rooster that crowed in the morn that woke #{before_the_house(9)}"
    when 11 
      "the farmer sowing his corn that kept #{before_the_house(10)}"
    when 12 
      "the horse and the hound and the horn that belonged to #{before_the_house(11)}"
    end 
  end
end
