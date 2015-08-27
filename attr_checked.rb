module Kernel
  def add_checked_attribute(klass, attr)
    klass.class_eval do
      define_method "#{attr}=" do |val|
        raise 'Invalid attribute' unless val
        instance_variable_set("@#{attr}", val)
      end

      define_method attr do
        instance_variable_get("@#{attr}")
      end
    end
  end
end

require 'minitest/autorun'

class Person; end

class TestCheckedAttribute < MiniTest::Unit::TestCase
  def setup
    add_checked_attribute(Person, :age)
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_nil_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = nil
    end
  end

  def test_refuses_false_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = false
    end
  end
end
