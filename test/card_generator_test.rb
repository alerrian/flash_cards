require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    generated_cards = CardGenerator.new("cards.txt")

    assert_instance_of CardGenerator, generated_cards
  end

  def test_filename_is_name_of_file
    generated_cards = CardGenerator.new("cards.txt")

    assert_equal "cards.txt", generated_cards.filename
  end
end