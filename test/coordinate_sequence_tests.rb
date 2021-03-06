
$: << File.dirname(__FILE__)
require 'test_helper'

class CoordinateSequenceTests < Test::Unit::TestCase
  include TestHelper

  def setup
    @cs = Geos::CoordinateSequence.new(3, 0)
  end

  def test_set_and_get_x
    @cs.set_x(0, 10.01)
    assert_in_delta(10.01, @cs.get_x(0), 0.0000001)
  end

  def test_set_and_get_y
    @cs.set_y(0, 20.02)
    assert_in_delta(20.02, @cs.get_y(0), 0.0000001)
  end

  def test_set_and_get_z
    @cs.set_z(0, 20.02)
    assert_in_delta(20.02, @cs.get_z(0), 0.0000001)
  end

  def test_set_and_get_ordinate
    @cs.set_ordinate(0, 0, 10.01)
    @cs.set_ordinate(0, 1, 20.02)
    @cs.set_ordinate(0, 2, 30.03)

    assert_in_delta(10.01, @cs.get_ordinate(0, 0), 0.0000001)
    assert_in_delta(20.02, @cs.get_ordinate(0, 1), 0.0000001)
    assert_in_delta(30.03, @cs.get_ordinate(0, 2), 0.0000001)
  end

  def test_length
    assert_equal(3, @cs.length)
  end

  def test_dimensions
    assert_equal(2, @cs.dimensions)
  end

  def test_check_bounds
    assert_raise(RuntimeError) { @cs.set_x(10, 0.1) }
    assert_raise(RuntimeError) { @cs.set_x(-1, 0.1) }

    assert_raise(RuntimeError) { @cs.set_y(10, 0.1) }
    assert_raise(RuntimeError) { @cs.set_y(-1, 0.1) }

    assert_raise(RuntimeError) { @cs.set_z(10, 0.1) }
    assert_raise(RuntimeError) { @cs.set_z(-1, 0.1) }

    assert_raise(RuntimeError) { @cs.set_ordinate(10, 0, 0.1) }
    assert_raise(RuntimeError) { @cs.set_ordinate(-1, 0, 0.1) }

    assert_raise(RuntimeError) { @cs.get_x(10) }
    assert_raise(RuntimeError) { @cs.get_x(-1) }

    assert_raise(RuntimeError) { @cs.get_y(10) }
    assert_raise(RuntimeError) { @cs.get_y(-1) }

    assert_raise(RuntimeError) { @cs.get_z(10) }
    assert_raise(RuntimeError) { @cs.get_z(-1) }

    assert_raise(RuntimeError) { @cs.get_ordinate(10, 0) }
    assert_raise(RuntimeError) { @cs.get_ordinate(-1, 0) }
  end

  def test_clone
    @cs.set_x(0, 1)
    @cs.set_y(0, 2)

    cs_b = @cs.clone

    assert_equal(@cs.get_x(0), cs_b.get_x(0))
    assert_equal(@cs.get_y(0), cs_b.get_y(0))
    assert_equal(@cs.dimensions, cs_b.dimensions)
  end

  def test_dup
    @cs.set_x(0, 1)
    @cs.set_y(0, 2)

    cs_b = @cs.dup

    assert_equal(@cs.get_x(0), cs_b.get_x(0))
    assert_equal(@cs.get_y(0), cs_b.get_y(0))
    assert_equal(@cs.dimensions, cs_b.dimensions)
  end
end
