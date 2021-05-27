class House
  def initialize(introduction_stategy = :DefualtStategy)
    @introduction_stategy = {
      DefualtStategy: DefualtIntroductionStategy,
      PirateStategy: PirateIntroductionStategy
    }[introduction_stategy].new
  end

  def recite
    (1..12).map { |i| line(i) }.join("\n")
  end

  def line(number)
    "#{introduction} #{things_around_the_house(number)}.\n"
  end

  private

  attr_reader :introduction_stategy

  SUBJECTS = [
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

  VERBS = [
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

  def subjects
    SUBJECTS
  end

  def verbs
    VERBS
  end

  def introduction
    introduction_stategy.introduction
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

  class PirateIntroductionStategy
    def introduction
      "Thar be"
    end
  end
  
  class DefualtIntroductionStategy
    def introduction
      "This is"
    end
  end
end


class FragmentedHouse < House 
  private

  attr_reader :verbs, :subjects

  def initialize
    @verbs = VERBS[1..].shuffle.unshift(VERBS.first)
    @subjects = SUBJECTS[1..].shuffle.unshift(SUBJECTS.first)
  end
end

class RandomHouse < House
  private
  
  attr_reader :verbs, :subjects

  def initialize
    indicies = VERBS[1..].length.times.map{ |i| i + 1 }.shuffle.unshift(0)
    @verbs = indicies.map { |i| VERBS[i] }
    @subjects = indicies.map { |i| SUBJECTS[i] }   
  end
end