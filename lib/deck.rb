class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end
  
  def count
    @cards.length
  end

  def cards_in_category(category)
    category_deck = @cards.map do |card|
      category_deck.push(card) if card.category == category
    end

    category_deck
  end
end