#include "numo.hpp"

void convert(numo::SFloat x) {
}

extern "C"
void Init_hello() {
  Rice::define_class("Hello")
    // cast
    .define_singleton_function("cast", [](numo::SFloat a) { return a; })
    .define_singleton_function("value", [](Rice::Object o) { return numo::Int64(o.value()); })
    .define_singleton_function("object", [](Rice::Object o) { return numo::Int64(o); })
    // compile
    .define_singleton_function("rank1", []() { return numo::SFloat({2}); })
    .define_singleton_function(
      "rank1_dynamic",
      []() {
        size_t n = 2;
        return numo::SFloat({n});
      })
    .define_singleton_function("return_object", []() -> Rice::Object { return numo::SFloat({2, 3}); })
    .define_singleton_function("convert_object", [](Rice::Object o) { convert(o); })
    // methods
    .define_singleton_function("ndim", [](const numo::NArray a) { return a.ndim(); })
    .define_singleton_function("size", [](const numo::NArray a) { return a.size(); })
    .define_singleton_function("contiguous?", [](const numo::NArray a) { return a.is_contiguous(); })
    .define_singleton_function(
      "read_ptr",
      [](numo::Int64 a) {
        auto ptr = a.read_ptr();
        Rice::Array b;
        for (size_t i = 0; i < a.size(); i++) {
          b.push(ptr[i]);
        }
        return b;
      })
    .define_singleton_function(
      "write_ptr",
      [](numo::Int64 a) {
        auto ptr = a.write_ptr();
        for (size_t i = 0; i < a.size(); i++) {
          ptr[i] = i + 1;
        }
      })
    .define_singleton_function(
      "write_ptr_new",
      []() {
        auto a = numo::Int64({3});
        auto ptr = a.write_ptr();
        ptr[0] = 1;
        ptr[1] = 2;
        ptr[2] = 3;
        return a;
      })
    .define_singleton_function(
      "write_ptr_robject",
      []() {
        auto a = numo::RObject({3});
        auto ptr = a.write_ptr();
        ptr[0] = INT2NUM(1);
        ptr[1] = INT2NUM(2);
        ptr[2] = INT2NUM(3);
        return a;
      })
    // types
    .define_singleton_function("sfloat", [](numo::SFloat x) { return x; })
    .define_singleton_function("dfloat", [](numo::DFloat x) { return x; })
    .define_singleton_function("int8", [](numo::Int8 x) { return x; })
    .define_singleton_function("int16", [](numo::Int16 x) { return x; })
    .define_singleton_function("int32", [](numo::Int32 x) { return x; })
    .define_singleton_function("int64", [](numo::Int64 x) { return x; })
    .define_singleton_function("uint8", [](numo::UInt8 x) { return x; })
    .define_singleton_function("uint16", [](numo::UInt16 x) { return x; })
    .define_singleton_function("uint32", [](numo::UInt32 x) { return x; })
    .define_singleton_function("uint64", [](numo::UInt64 x) { return x; })
    .define_singleton_function("scomplex", [](numo::SComplex x) { return x; })
    .define_singleton_function("dcomplex", [](numo::DComplex x) { return x; })
    .define_singleton_function("bit", [](numo::Bit x) { return x; })
    .define_singleton_function("robject", [](numo::RObject x) { return x; });
}
