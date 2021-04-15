class House
  def initialize
  end

  def line(number)
    case number
    when 1
      "This is the house that Jack built.\n"
    else
      "This is the malt that lay in the house that Jack built.\n"
    end
  end
end
