module Printable
  def print
    'Printable print'
  end

  def prepare_cover
  end
end


module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen
  end

  def print
    'Document print'
  end
end

class Book
  include Printable
  include Document
end

require 'minitest/autorun'

class TestBook < MiniTest::Unit::TestCase
  def setup
    @b = Book.new
  end

  def test_false_print
    refute_equal 'Printable print', @b.print_to_screen
  end

  def test_true_print
    assert_equal 'Document print', @b.print_to_screen
  end
end
