class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end
  
  def count
    @cards.count
  end

  def cards_in_category(category)
    # Access cards array
    # find elements in array that have specific category
    #   For each element in the array access .category parameter
    #     compare to card.category
    #     if same, send to terminal
    #     else ignore
    @cards.each |card| do
      if card.category == category
        card
      end
    end
  end
end