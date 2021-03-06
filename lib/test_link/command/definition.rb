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

require 'test_link/command/argument'

module TestLink
  module Command
    class Definition
      @@arguments = {}

      def self.argument name, options = {}
        options = {
            :default => nil,
            :mandatory => false
        }.merge(options)
        name = name.intern
        attr_accessor name
        self.arguments[name] = Argument.new options[:default], options[:mandatory]
      end

      def self.arguments
        @@arguments[self.command_name] = {} if @@arguments[self.command_name].nil?
        @@arguments[self.command_name]
      end

      def self.command_name
        classname = self.name.split('::').last
        classname[0] = classname[0].downcase
        classname
      end
    end
  end
end