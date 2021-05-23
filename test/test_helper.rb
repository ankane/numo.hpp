require "bundler/setup"
Bundler.require(:default)
require "minitest/autorun"
require "minitest/pride"

require "numo/narray"
require_relative "../lib/hello"
