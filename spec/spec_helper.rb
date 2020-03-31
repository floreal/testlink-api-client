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
#    along with testlink-api-client.  If not, see <http://www.gnu.org/licenses/>.
require 'rspec/expectations'
module RSpec::Matchers
  def attribute_provided? object, attribute
    assignment = (attribute.to_s + '=').to_sym
    (object.respond_to? attribute) && (object.respond_to? assignment)
  end
end

RSpec::Matchers.define :provide do |attribute|
  match do |object|
    attribute_provided? object, attribute
  end
end

RSpec::Matchers.define :provide_mandatory_argument do |argument|
  match do |command|
    (attribute_provided? command, argument) && command.class.arguments[argument].mandatory?
  end
end

RSpec::Matchers.define :provide_argument do |argument|
  match do |command|
    (attribute_provided? command, argument) && (command.class.arguments.has_key? argument)
  end
end