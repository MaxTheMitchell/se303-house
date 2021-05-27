class House
  def initialize(introduction_stategy = :DefualtStrategy, phrase_stategy = :DefualtStrategy)
    @introduction_strategy = {
      DefualtStrategy: DefualtIntroductionStategy,
      PirateStrategy: PirateIntroductionStategy
    }[introduction_stategy].new
    @phrase_strategy = {
      DefualtStrategy: DefualtPhraseStrategy,
      RandomStrategy: RandomPhraseStrategy,
      FragmentedStrategy: FragmentedPhraseStrategy
    }[phrase_stategy].new(SUBJECTS, VERBS)
  end

  def recite
    (1..12).map { |i| line(i) }.join("\n")
  end

  def line(number)
    "#{introduction} #{phrases(number)}.\n"
  end

  private

  attr_reader :introduction_strategy, :phrase_strategy

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
    phrase_strategy.subjects
  end

  def verbs
    phrase_strategy.verbs
  end

  def introduction
    introduction_strategy.introduction
  end

  def phrases(number)
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

  class RandomPhraseStrategy
    attr_reader :subjects, :verbs

    def initialize(subjects, verbs)
      indicies = verbs[1..].length.times.map{ |i| i + 1 }.shuffle.unshift(0)
      @verbs = indicies.map { |i| verbs[i] }
      @subjects = indicies.map { |i| subjects[i] }
    end
  end

  class FragmentedPhraseStrategy
    attr_reader :subjects, :verbs

    def initialize(subjects, verbs)
      @verbs = verbs[1..].shuffle.unshift(verbs.first)
      @subjects = subjects[1..].shuffle.unshift(subjects.first)
    end
  end

  class DefualtPhraseStrategy
    attr_reader :subjects, :verbs

    def initialize(subjects, verbs)
      @subjects = subjects
      @verbs = verbs
    end
  end
end