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

Gem::Specification.new do |spec|
  spec.name = 'testlink-api-client'
  spec.version = '0.0.1'
  spec.date = %q{2011-03-22}
  spec.description = <<-EOF
    TestLink API Client allow to use the TestLink Remote API.
  EOF
  spec.summary = 'A ruby TestLink API Client'
  spec.author = 'Floréal TOUMIKIAN'
  spec.email = 'ftoumikian@april.org'
  spec.homepage = 'http://github.com/floreal/testlink-api-client/'

  spec.files = Dir['lib/**/*.rb']

  spec.add_development_dependency('rspec')
end