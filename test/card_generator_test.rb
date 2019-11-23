require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class RoundTest < Minitest::Test
  def test_it_exists
    cards = CardGenerator.new()

    assert_instance_of CardGenerator, cards
  end
end