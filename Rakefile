require "rake/testtask"
require "rake/extensiontask"

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
end

task default: :test

Rake::ExtensionTask.new("hello")
