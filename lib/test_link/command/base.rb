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
require 'test_link/api_link'

module TestLink
  module Command
    class Base < Definition
      argument :devKey, :mandatory => true

      def execute link
        self.devKey ||= link.key
        errors = check_arguments
        raise ArgumentError.new "Missing mandatory argument(s) #{errors}" unless errors.empty?
        link.client.call 'tl.' + self.class.command_name, arguments_hash
      end

      def arguments_hash
        args = {}
        (Base.arguments.keys + self.class.arguments.keys).each do |name|
          args[name] = self.send(name)
        end
        args
      end

      def reset_arguments_hash hash
        arguments_hash.keys.each do |name|
          assignment = (name.to_s + '=').to_sym
          send(assignment, hash[name])
        end
      end

      def check_arguments
        errors = []
        self.class.arguments.select{ |name, argument| argument.mandatory? }.keys.each do |name|
          errors.push name if arguments_hash[name].nil?
        end
        errors
      end

      def self.remote_method
        TestLink::ApiLink.remote_method self
      end

      def self.adapt_with klass
        TestLink::ApiLink.set_adapter_for self.command_name, klass
      end
    end
  end
end
