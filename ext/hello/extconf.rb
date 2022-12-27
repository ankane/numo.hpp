require "mkmf-rice"
require "numo/narray"

numo = File.join(Gem.loaded_specs["numo-narray"].require_path, "numo")
abort "Numo header not found" unless find_header("numo/narray.h", numo)
abort "Numo library not found" if Gem.win_platform? && !find_library("narray", nil, numo)
$LDFLAGS += " -Wl,-undefined,dynamic_lookup" if RbConfig::CONFIG["host_os"] =~ /darwin/i

find_header("numo.hpp", File.expand_path("../../include", __dir__))

create_makefile("hello")
