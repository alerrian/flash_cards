require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'

# Create new cards for the program to run and use
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

# Add cards to array for movement to deck
cards = [card_1, card_2, card_3]

# Add cards to deck
deck = Deck.new(cards)

# Add deck to new round
round = Round.new(deck)

# Start program

def start
  
end