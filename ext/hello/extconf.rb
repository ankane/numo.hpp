require "mkmf-rice"

numo = $LOAD_PATH.find { |v| File.exist?("#{v}/numo/numo/narray.h") }
abort "Numo header not found" unless numo && find_header("numo/narray.h", "#{numo}/numo")
abort "Numo library not found" if Gem.win_platform? && !find_library("narray", nil, "#{numo}/numo")

find_header("numo.hpp", File.expand_path("../../include", __dir__))

create_makefile("hello")
