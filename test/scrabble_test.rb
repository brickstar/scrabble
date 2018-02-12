require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class ScrabbleTest < Minitest::Test

  def test_scrabble_exists
    game = Scrabble.new

    assert_instance_of Scrabble, game
  end


  def test_it_can_score_a_letter
    game = Scrabble.new

    assert_equal 1, game.score_letter('a')
  end

  def test_it_returns_0_if_word_is_empty_string
    game = Scrabble.new

    assert_equal 0, game.score("")
  end

  def test_it_returns_nil_if_word_is_empty_string
    game = Scrabble.new

    assert_equal 0, game.score(nil)
  end

  def test_it_can_score_a_word
    game = Scrabble.new

    assert_equal 8, game.score('hello')
  end

  def test_it_can_score_with_multipliers
    game = Scrabble.new

    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_it_can_use_word_multiplier
    game = Scrabble.new

    assert_equal 48, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end
end
