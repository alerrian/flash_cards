class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end
  
  def count
    @cards.length
  end

  def cards_in_category(category)
    # Access cards array
    # find elements in array that have specific category
    #   For each element in the array access .category parameter
    #     compare to card.category
    #     if same, send to terminal
    #     else ignore
    category_deck = @cards.map do |card|
      category_deck.push(card) if card.category == category
    end

    category_deck
  end
end