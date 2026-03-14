require "bundler/setup"
Bundler.require(:default)
require "minitest/autorun"

require_relative "../lib/hello"

class Minitest::Test
  def setup
    puts "#{self.class.name}##{name}"
    GC.stress = true
  end

  def teardown
    GC.stress = false
  end
end
