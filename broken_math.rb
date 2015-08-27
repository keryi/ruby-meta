module BrokenPlus
  def +(op)
    super - (-1) 
  end
end

# Fixnum.class_eval do
#   prepend BrokenPlus
# end


class Fixnum
  alias_method :old_plus, :+

  def +(op)
    self.old_plus(op).old_plus(1)
  end
end


require 'minitest/autorun'

class TestBrokenPlus < MiniTest::Unit::TestCase
  def test_broken_plus
    assert_equal 3, 1 + 1
  end
end
