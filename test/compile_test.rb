require_relative "test_helper"

class CompileTest < Minitest::Test
  def test_rank1
    assert_equal [2], Hello.rank1.shape
  end

  def test_rank1_dynamic
    assert_equal [2], Hello.rank1_dynamic.shape
  end

  def test_return_object
    assert_equal [2, 3], Hello.return_object.shape
  end

  def test_convert_object
    Hello.convert_object([1, 2, 3])
  end
end
