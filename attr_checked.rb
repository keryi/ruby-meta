class Class
  def attr_checked(attr, &block)
    define_method "#{attr}=" do |val|
      raise 'Invalid attribute' unless block.call(val)
      instance_variable_set("@#{attr}", val)
    end

    define_method attr do
      instance_variable_get("@#{attr}")
    end
  end
end

require 'minitest/autorun'

class Person
  attr_checked :age do |v|
    v >= 18
  end
end

class TestCheckedAttribute < MiniTest::Unit::TestCase
  def setup
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_invalid_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = 17
    end
  end
end
