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

  def test_that_current_card_is_first_card_in_deck
    deck = Deck.new(@cards)
    round = Round.new(deck)

    assert_equal @cards[0], round.current_card
  end

  def test_take_turn_returns_turn
    deck = Deck.new(@cards)
    round = Round.new(deck)

    turn_result = round.take_turn("Juneau")

    assert_equal Turn, turn_result.class
    assert_equal @cards[0], turn_result.card
    assert_equal "Juneau", turn_result.guess
  end

  def test_take_turns_adds_turn_to_turns
    deck = Deck.new(@cards)
    round = Round.new(deck)

    turn_result = round.take_turn("Juneau")

    assert_equal round.turns[0], turn_result
  end

  def test_take_turns_increments_number_correct
    deck = Deck.new(@cards)
    round = Round.new(deck)

    round.take_turn("Juneau")

    assert_equal 1, round.number_correct
  end

end