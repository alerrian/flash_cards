class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = gen_cards_from_file(filename)
  end

  def gen_cards_from_file(filename)
    # create an array to hold each card
    generated_cards = []
    # opens the file passed in by name and checks it line by line
    File.open(filename).each do |line|
      # hold each piece of lines delimited by comma in array?
      attributes = line.chomp.split(",")
      # create a new card from the pieces of the line array
      card = Card.new(attributes[0], attributes[1], attributes[2])
      # send those cards out to the cards array
      generated_cards.push(card)
    end

    generated_cards
  end
end