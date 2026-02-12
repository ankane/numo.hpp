require_relative "test_helper"

class CastTest < Minitest::Test
  def test_cast
    x = Numo::Int64.cast([1, 2, 3])
    assert_kind_of Numo::SFloat, Hello.cast(x)
  end

  def test_cast_error
    assert_raises(Numo::NArray::CastError) do
      Hello.cast("bad")
    end
  end

  def test_value
    x = Hello.value([1, 2, 3])
    assert_kind_of Numo::Int64, x
    assert_equal [1, 2, 3], x.to_a
  end

  def test_object
    x = Hello.object([1, 2, 3])
    assert_kind_of Numo::Int64, x
    assert_equal [1, 2, 3], x.to_a
  end
end
