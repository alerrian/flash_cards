class Round
  attr_reader :number_correct, :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @current_card_number = 0
    @number_correct_by_category = Hash.new(0)
    @number_per_category = Hash.new(0)
  end

  def current_card
    @deck.cards[@current_card_number]
  end

  def take_turn(current_guess)
    new_turn = Turn.new(current_guess, current_card)
    @turns.push(new_turn)

    @number_per_category[current_card.category] += 1

    if new_turn.correct?
      @number_correct += 1
      @number_correct_by_category[current_card.category] += 1
    end

    p new_turn.feedback

    @current_card_number += 1

    new_turn
  end

  def number_correct_by_category(category)
    @number_correct_by_category[category]
  end

  def percent_correct
    return (@number_correct.to_f / (@current_card_number)) * 100
  end

  def percent_correct_by_category(category)
    return (@number_correct_by_category[category].to_f / @number_per_category[category]) * 100
  end

  def start
    p "-------------------------------------------------"
    p "Welcome! You're playing with #{deck.count} cards."
    p "-------------------------------------------------"

    until @current_card_number >= deck.count do 
      p "This is card number #{@current_card_number + 1} of #{deck.count}."
      p "Question: " + deck.cards[@current_card_number].question

      # Get user guess
      user_guess = gets.chomp

      # Compare user guess to current card answer
      take_turn(user_guess.downcase)
    end

    puts "\n****** GAME OVER! ******"
    p "You had #{@number_correct} correct guesses out of #{deck.count} for a total score of #{percent_correct.round(0)}%."
    p "STEM - #{percent_correct_by_category(:STEM).round(0)}% correct"
    p "Turing Staff - #{percent_correct_by_category(:Turing_Staff).round(0)}% correct"
    p "Pop Culture - #{percent_correct_by_category(:Pop_Culture).round(0)}% correct"
  end
end