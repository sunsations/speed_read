require_relative 'test_helper'

require 'minitest/autorun'

class SpeedReadTest < Minitest::Unit::TestCase

  def test_word_tokenization
    assert_equal ["a", "b", "c"], SpeedRead.tokenize("a b c")
  end

  def test_word_tokenization_with_punctuation
    assert_equal ["a", "b", "c."], SpeedRead.tokenize("a b c.")
    assert_equal ["a", "b", "c?"], SpeedRead.tokenize("a b c?")
    assert_equal ["a", "b:", "c"], SpeedRead.tokenize("a b: c")
    assert_equal ["a,", "b", "c"], SpeedRead.tokenize("a, b c")
  end

  def test_word_tokenization_with_new_line
    assert_equal ["a", "b", "c"], SpeedRead.tokenize("a b c\n")
    assert_equal ["a", "b", "c"], SpeedRead.tokenize("\na b c")
    assert_equal ["a", "b", "c"], SpeedRead.tokenize("\na \nb \nc\n")
  end

  def test_word_tokenization_with_leading_whitespaces
    assert_equal ["a", "b", "c"], SpeedRead.tokenize("   a b c")
  end

  def test_word_tokenization_with_trailing_whitespaces
    assert_equal ["a", "b", "c"], SpeedRead.tokenize("a b c     ")
  end

  def test_find_correct_orp
    assert_equal 0, SpeedRead.find_ORP("")
    assert_equal 0, SpeedRead.find_ORP("1")
    assert_equal 1, SpeedRead.find_ORP("12")
    assert_equal 1, SpeedRead.find_ORP("12345")
    assert_equal 2, SpeedRead.find_ORP("123456")
    assert_equal 2, SpeedRead.find_ORP("123456789")
    assert_equal 3, SpeedRead.find_ORP("1234567890")
    assert_equal 4, SpeedRead.find_ORP("123456789012345678")
  end

  def test_word_colorize
    assert_equal "a\e[0;31;49mb\e[0mc", SpeedRead.colorize_word("abc", 1)
    assert_equal "12\e[0;31;49m3\e[0m456789", SpeedRead.colorize_word("123456789", 2)
  end

  def test_word_colorize_with_invalid_input
    assert_equal "", SpeedRead.colorize_word(nil, 0)
  end

end
