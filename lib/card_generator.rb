class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  def cards
    # create an array to hold each card
    generated_cards = []
    # opens the file passed in by name and checks it line by line
    File.open(@filename).each do |each_line|
      # hold each piece of lines delimited by comma in array?
      attributes = each_line.chomp.split(",")
      # create a new card from the pieces of the line array
      card = Card.new(attributes[0], attributes[1], attributes[2])
      # send those cards out to the cards array
      generated_cards.push(card)
    end

    generated_cards
  end
end