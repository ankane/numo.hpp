require_relative "test_helper"

class CompileTest < Minitest::Test
  def test_rank1
    assert_equal [2], Hello.rank1.shape
    assert_equal 2, Hello.rank1.size
  end

  def test_rank1_dynamic
    assert_equal [2], Hello.rank1_dynamic.shape
    assert_equal 2, Hello.rank1_dynamic.size
  end

  def test_rank2
    assert_equal [2, 3], Hello.rank2.shape
    assert_equal 6, Hello.rank2.size
  end

  def test_rank2_dynamic
    assert_equal [2, 3], Hello.rank2_dynamic.shape
    assert_equal 6, Hello.rank2_dynamic.size
  end

  def test_rank3
    assert_equal [2, 3, 4], Hello.rank3.shape
    assert_equal 24, Hello.rank3.size
  end

  def test_return_object
    assert_equal [2, 3], Hello.return_object.shape
  end

  def test_convert_object
    Hello.convert_object([1, 2, 3])
  end
end
