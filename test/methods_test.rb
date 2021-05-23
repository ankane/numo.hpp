require_relative "test_helper"

class MethodsTest < Minitest::Test
  def test_ndim
    x = Numo::SFloat.new(2, 3)
    assert_equal 2, Hello.ndim(x)
  end

  def test_size
    x = Numo::SFloat.new(2, 3)
    assert_equal 6, Hello.size(x)
  end

  def test_is_contiguous
    x = Numo::SFloat.new(3).seq
    assert Hello.contiguous?(x)
    refute Hello.contiguous?(x.reverse)
  end

  def test_read_ptr
    assert_equal [1, 2, 3], Hello.read_ptr(Numo::Int64.cast([1, 2, 3]))
    assert_equal [2, 3], Hello.read_ptr(Numo::Int64.cast([1, 2, 3])[1..-1])
    assert_equal [3, 2, 1], Hello.read_ptr(Numo::Int64.cast([1, 2, 3].reverse))
    assert_equal [1, 3, 2, 4], Hello.read_ptr(Numo::Int64.cast([[1, 2], [3, 4]]).transpose)
  end

  def test_write_ptr
    a = Numo::Int64.new(3)
    Hello.write_ptr(a)
    assert_equal [1, 2, 3], a.to_a

    # copied, not changed
    b = Numo::Int32.new(3).seq
    Hello.write_ptr(b)
    assert_equal [0, 1, 2], b.to_a

    # view, changed
    c = Numo::Int64.new(3).seq.reverse
    Hello.write_ptr(c)
    assert_equal [3, 2, 1], c.to_a
  end

  def test_write_ptr_new
    assert_equal [1, 2, 3], Hello.write_ptr_new.to_a
  end

  def test_write_ptr_robject
    assert_equal [1, 2, 3], Hello.write_ptr_robject.to_a
  end
end
