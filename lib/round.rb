class Round
  attr_accessor :deck, :turns
  attr_reader :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(current_guess)
    new_turn = Turn.new(current_guess, current_card)
    @turns.push(new_turn)

    require 'pry'; binding.pry

    if new_turn.correct?
      @number_correct += 1
    end

    new_turn
  end
end