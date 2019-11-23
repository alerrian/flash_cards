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

  def test_current_card_returns_next_card
    deck = Deck.new(@cards)
    round = Round.new(deck)

    round.take_turn("Juneau")

    assert_equal deck.cards[1], round.current_card
  end

  def test_turns_gets_another_card
    deck = Deck.new(@cards)
    round = Round.new(deck)

    round.take_turn("Juneau")
    turn_result = round.take_turn("Venus")

    assert_equal round.turns[1], turn_result
  end

  def test_turns_adds_new_card
    deck = Deck.new(@cards)
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 2, round.turns.count
  end

  def test_feedback_is_incorrect
    deck = Deck.new(@cards)
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal "Incorrect.", round.turns.last.feedback
  end

  def test_take_turn_increments_number_correct
    deck = Deck.new(@cards)
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 1, round.number_correct
  end

  def test_number_correct_by_category
    deck = Deck.new(@cards)
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 1, round.number_correct_by_category(:Geography)
  end

  def test_number_correct_by_category_does_not_keep_incorrect
    deck = Deck.new(@cards)
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 0, round.number_correct_by_category(:STEM)
  end

  def test_percent_correct_returns_float_percent
    deck = Deck.new(@cards)
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 50.0, round.percent_correct
  end

  def test_percent_correct_category_returns_float_percent
    deck = Deck.new(@cards)
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 100.0, round.percent_correct_by_category(:Geography)
  end

  def test_percent_correct_category_returns_float_percent
    deck = Deck.new(@cards)
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 0.0, round.percent_correct_by_category(:STEM)
  end

end