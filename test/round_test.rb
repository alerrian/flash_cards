require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [card_1, card_2, card_3]
  end
  def test_it_exists    
    deck = Deck.new(@cards)
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_round_has_a_deck
    deck = Deck.new(@cards)
    round = Round.new(deck)

    assert round.deck
  end

  def test_round_turns_starts_empty
    deck = Deck.new(@cards)
    round = Round.new(deck)

    assert_equal [], round.turns
  end
end