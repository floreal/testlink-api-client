#    This file is part of testlink-api-client.
#
#    testlink-api-client is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    testlink-api-client is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'
require 'rake/gempackagetask'
require 'rake/clean'

require 'cucumber'
require 'cucumber/rake/task'

require File.join(File.dirname(__FILE__), 'features', 'support', 'test_link_db.rb')

CLOBBER.add('reports')

gemspecs = Gem::Specification.load('testlink-api-client.gemspec')

Rake::GemPackageTask.new(gemspecs) { |pkg| }

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = ENV['CUKE_FLAGS'] || '--format pretty'
end

desc "Prepare database for tests"
task :prepare do |t|
  include TestLinkDb
  reset_db
end

task :features => [:prepare]
