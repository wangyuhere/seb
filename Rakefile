require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "test/*_test.rb"
end

desc "Start the development console"
task :console do
  require 'pry'
  require 'seb'
  pry
end
