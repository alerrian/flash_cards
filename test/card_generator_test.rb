require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    generated_cards = CardGenerator.new("cards.txt")

    assert_instance_of CardGenerator, generated_cards
  end
end