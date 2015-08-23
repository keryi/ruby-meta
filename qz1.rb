require 'minitest/autorun'

class TestEx1 < MiniTest::Unit::TestCase
  def test_class_of_object
    assert_equal Class, Object.class
  end

  def test_superclass_of_module
    assert_equal Object, Module.superclass
  end

  def test_class_of_class
    assert_equal Class, Class.class
  end
end
