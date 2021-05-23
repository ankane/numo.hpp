require_relative "test_helper"

class TypesTest < Minitest::Test
  def test_sfloat
    assert_type :sfloat, Numo::SFloat
  end

  def test_dfloat
    assert_type :dfloat, Numo::DFloat
  end

  def test_int8
    assert_type :int8, Numo::Int8
  end

  def test_int16
    assert_type :int16, Numo::Int16
  end

  def test_int32
    assert_type :int32, Numo::Int32
  end

  def test_int64
    assert_type :int64, Numo::Int64
  end

  def test_uint8
    assert_type :uint8, Numo::UInt8
  end

  def test_uint16
    assert_type :uint16, Numo::UInt16
  end

  def test_uint32
    assert_type :uint32, Numo::UInt32
  end

  def test_uint64
    assert_type :uint64, Numo::UInt64
  end

  def test_scomplex
    assert_type :scomplex, Numo::SComplex
  end

  def test_dcomplex
    assert_type :dcomplex, Numo::DComplex
  end

  def test_bit
    assert_type :bit, Numo::Bit
  end

  def test_robject
    assert_type :robject, Numo::RObject
  end

  def assert_type(method, cls)
    assert_kind_of cls, Hello.send(method, cls.new)
  end
end
