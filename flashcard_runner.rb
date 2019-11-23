require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'

# Create new cards for the program to run and use
card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "giraffe", :Turing_Staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "justin bieber", :Pop_Culture)
card_5 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "mars", :STEM)

# Add cards to array for movement to deck
cards = [card_1, card_2, card_3, card_4, card_5]

# Add cards to deck
deck = Deck.new(cards)

# Add deck to new round
round = Round.new(deck)

# Start program
round.start