require "bundler/setup"
Bundler.require(:default)
require "minitest/autorun"

require_relative "../lib/hello"

class Minitest::Test
  def valgrind?
    ENV["RUBY_MEMCHECK_RUNNING"]
  end
end
