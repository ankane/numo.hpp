# Numo.hpp

C++ header for Numo and Rice

[![Build Status](https://github.com/ankane/numo.hpp/workflows/build/badge.svg?branch=master)](https://github.com/ankane/numo.hpp/actions)

## Installation

Copy [numo.hpp](include/numo.hpp) into your project and add the following lines to `extconf.rb`:

```ruby
numo = $LOAD_PATH.find { |v| File.exist?("#{v}/numo/numo/narray.h") }
abort "Numo header not found" unless numo && find_header("numo/narray.h", "#{numo}/numo")
abort "Numo library not found" if Gem.win_platform? && !find_library("narray", nil, "#{numo}/numo")
```

## Getting Started

Include the header

```cpp
#include "numo.hpp"
```

Use Numo types for arguments (including `numo::NArray` for any type)

```cpp
define_function("sum", [](numo::SFloat a) { /* your code */ });
```

Or create a new array

```cpp
auto a = numo::Int64({2});
```

And use a pointer to write to it

```cpp
auto ptr = a.write_ptr();
ptr[0] = 4;
ptr[1] = 3;
```

## Methods

Get the number of dimensions

```cpp
a.ndim();
```

Get the number of elements

```cpp
a.size();
```

Get the shape

```cpp
a.shape();
```

Get a read pointer

```cpp
a.read_ptr();
```

Get a write pointer

```cpp
a.write_ptr();
```

Check if contiguous

```cpp
a.is_contiguous();
```

## Projects

Projects that use Numo.hpp

- [Faiss](https://github.com/ankane/faiss)
- [Midas](https://github.com/ankane/midas)

## History

View the [changelog](https://github.com/ankane/numo.hpp/blob/master/CHANGELOG.md)

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ankane/numo.hpp/issues)
- Fix bugs and [submit pull requests](https://github.com/ankane/numo.hpp/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

To get started with development:

```sh
git clone https://github.com/ankane/numo.hpp.git
cd numo.hpp
bundle install
bundle exec rake compile
bundle exec rake test
```
