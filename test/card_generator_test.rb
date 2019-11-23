require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    cards = CardGenerator.new()

    assert_instance_of CardGenerator, cards
  end

  def test_filename_is_the_file_name
    cards = CardGenerator.new()

    asser_equal "cards.txt", cards.filename
  end
end