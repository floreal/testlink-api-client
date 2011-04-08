require 'rake'
require 'rspec/core/rake_task'
require 'rake/gempackagetask'
require 'rubygems'


gemspecs = Gem::Specification.load('testlink-api-client.gemspec')

Rake::GemPackageTask.new(gemspecs) { |pkg| }

RSpec::Core::RakeTask.new(:spec)