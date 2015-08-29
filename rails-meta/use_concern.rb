require 'active_support'

module Foo
  extend ActiveSupport::Concern

  def foo_instance_method; __method__; end

  module ClassMethods
    def foo_class_method; __method__; end
  end
end

require 'minitest/autorun'

class Bar
  include Foo
end

class TestBar < MiniTest::Unit::TestCase
  def test_instance_method
    assert Bar.new.respond_to?(:foo_instance_method)
  end

  def test_class_method
    assert Bar.respond_to?(:foo_class_method)
  end
end
