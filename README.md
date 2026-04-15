# Numo.hpp

C++ header for [numo-narray-alt](https://github.com/yoshoku/numo-narray-alt) and [Rice](https://github.com/jasonroelofs/rice)

[![Build Status](https://github.com/ankane/numo.hpp/actions/workflows/build.yml/badge.svg)](https://github.com/ankane/numo.hpp/actions)

## Installation

Copy [numo.hpp](https://raw.githubusercontent.com/ankane/numo.hpp/v0.3.1/include/numo.hpp) into your project and add the following lines to `extconf.rb`:

```ruby
require "numo/narray/alt"

numo = File.join(Gem.loaded_specs["numo-narray-alt"].require_path, "numo")
abort "Numo header not found" unless find_header("numo/narray.h", numo)
abort "Numo library not found" if Gem.win_platform? && !find_library("narray", nil, "#{numo}/narray")
$LDFLAGS += " -Wl,-undefined,dynamic_lookup" if RbConfig::CONFIG["host_os"] =~ /darwin/i
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
numo::Int64 a({3, 5});
```

And use a pointer to write to it

```cpp
auto* ptr = a.write_ptr();
ptr[0] = 4;
ptr[1] = 3;
```

## Methods

Get the number of dimensions

```cpp
size_t ndim = a.ndim();
```

Get the number of elements

```cpp
size_t size = a.size();
```

Get the shape

```cpp
const size_t* shape = a.shape();
```

Get a read pointer

```cpp
const auto* ptr = a.read_ptr();
```

Get a write pointer

```cpp
auto* ptr = a.write_ptr();
```

Check if contiguous

```cpp
bool contiguous = a.is_contiguous();
```

## Projects

Projects that use Numo.hpp

- [Faiss](https://github.com/ankane/faiss)
- [Midas](https://github.com/ankane/midas)
- [Umappp](https://github.com/kojix2/ruby-umappp)

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
