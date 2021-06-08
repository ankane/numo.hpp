require_relative "test_helper"

class CompileTest < Minitest::Test
  def test_rank1
    x = Hello.rank1
    assert_equal [2], x.shape
    assert_equal 2, x.size
    assert_equal 1, x.ndim
  end

  def test_rank1_dynamic
    x = Hello.rank1_dynamic
    assert_equal [2], x.shape
    assert_equal 2, x.size
    assert_equal 1, x.ndim
  end

  def test_rank2
    x = Hello.rank2
    assert_equal [2, 3], x.shape
    assert_equal 6, x.size
    assert_equal 2, x.ndim
  end

  def test_rank2_dynamic
    x = Hello.rank2_dynamic
    assert_equal [2, 3], x.shape
    assert_equal 6, x.size
    assert_equal 2, x.ndim
  end

  def test_rank3
    x = Hello.rank3
    assert_equal [2, 3, 4], x.shape
    assert_equal 24, x.size
    assert_equal 3, x.ndim
  end

  def test_return_object
    assert_equal [2, 3], Hello.return_object.shape
  end

  def test_convert_object
    Hello.convert_object([1, 2, 3])
  end
end
