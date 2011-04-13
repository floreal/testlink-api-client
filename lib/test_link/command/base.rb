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

require 'test_link/command/definition'

module TestLink
  module Command
    class Base < Definition
      argument :devKey, :mandatory => true

      def execute link
        self.devKey ||= link.key
        link.client.call self.class.command_name, arguments_hash
      end

      def arguments_hash
        args = {}
        self.class.arguments.keys.each do |name|
          args[name] = self.send(name)
        end
        args
      end
    end
  end
end
