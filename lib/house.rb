class House
  def recite
    (1..12).map { |i| line(i) }.join("\n")
  end

  def line(number)
    "#{introduction} #{things_around_the_house(number)}.\n"
  end

  private

  def introduction
    "This is"
  end

  def things_around_the_house(number)
    verses[0...number].reverse.join(" ")
  end

  def verses
    12.times.map { |i| verse(i) }
  end

  def verse(index)
    "the #{subjects[index]} that #{verbs[index]}"
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
      "priest all shaven and shorn",
      "rooster that crowed in the morn",
      "farmer sowing his corn",
      "horse and the hound and the horn",
    ]
  end

  def verbs
    [
      "Jack built",
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

class RandomHouse < House 
  private

  def verse(index)
    if index == 0
      "the #{subjects.first} that #{verbs.first}"
    else 
      "the #{subjects.sample} that #{verbs.sample}"
    end
  end
end
