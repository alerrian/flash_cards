require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

# create new card deck
generate_cards = CardGenerator.new('cards.txt')

# Add cards to deck
deck = Deck.new(generate_cards.cards)

# Add deck to new round
round = Round.new(deck)

# Start program
round.start