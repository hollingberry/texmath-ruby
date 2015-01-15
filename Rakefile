require 'bundler/gem_tasks'

desc 'Run the tests'
task :test do
  $LOAD_PATH.unshift 'lib', 'test'
  Dir['test/**/*_test.rb'].each do |file|
    require File.expand_path(file)
  end
end
