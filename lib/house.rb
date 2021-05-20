class House
  def recite
    (1..12).map { |i| line(i) }.join("\n")
  end

  def random_recite
    (1..12).map { |i| random_line(i) }.join("\n")
  end

  def line(number)
    "#{introduction} #{things_around_the_house(number)}\n"
  end

  def random_line(number)
    "#{introduction} #{random_things_around_the_house(number)}\n"
  end

  private

  def introduction
    "This is"
  end

  def things_around_the_house(number)
    verses[0...number].reverse.join(" ")
  end

  def random_things_around_the_house(number)
    (verses[1..].shuffle.take(number - 1) << verses[0]).join(" ")
  end

  def verses
    [
      "the house that Jack built.",
      "the malt that lay in",
      "the rat that ate",
      "the cat that killed",
      "the dog that worried",
      "the cow with the crumpled horn that tossed",
      "the maiden all forlorn that milked",
      "the man all tattered and torn that kissed",
      "the priest all shaven and shorn that married",
      "the rooster that crowed in the morn that woke",
      "the farmer sowing his corn that kept",
      "the horse and the hound and the horn that belonged to",
    ]
  end

  def subjects
    [
      "house",
      "malt",
      "rat",
      "cat",
      "dog",
      "cow with the crumpled horn",
      "maiden all forlorn",
      "man all tattered and torn",
      "the priest all shaven and shorn",
      "rooster that crowed in the morn",
      "farmer sowing his corn",
      "horse and the hound and the horn",
    ]
  end

  def verbs
    [
      "Jack built.",
      "lay in",
      "ate",
      "killed",
      "worried",
      "tossed",
      "milked",
      "kissed",
      "married",
      "woke",
      "kept",
      "belonged to",
    ]
  end
end

class PirateHouse < House
  private

  def introduction
    "Thar be"
  end
end
