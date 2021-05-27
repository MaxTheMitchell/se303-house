class House
  def initialize
    @subjects =
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
  @verbs =
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

  def recite
    (1..12).map { |i| line(i) }.join("\n")
  end

  def line(number)
    "#{introduction} #{things_around_the_house(number)}.\n"
  end

  private

  attr_reader :verbs, :subjects

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
    create_verse(subjects[index], verbs[index])
  end

  def create_verse(subject, verb)
    "the #{subject} that #{verb}"
  end
end

class PirateHouse < House
  private

  def introduction
    "Thar be"
  end
end

class FragmentedHouse < House 
  private

  def verse(index)
    if index == 0
      create_verse(subjects.first, verbs.first)
    else 
      create_verse(subjects.sample, verbs.sample)
    end
  end
end

class RandomHouse < House
  private

  def things_around_the_house(number)
    verses[1..].shuffle.take(number - 1).append(verses[0]).join(" ")
  end
end