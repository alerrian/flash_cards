class Round
  attr_accessor :deck, :turns
  attr_reader :correct_answers

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_answers = 0
  end

  def current_card
    @deck.cards.shift
  end

  def take_turn(current_guess)
    @new_turn = Turn.new(current_guess, current_card)
  end

  def number_correct
    if @new_turn.correct?
      @correct_answers += 1
    end

    @correct_answers
  end
end