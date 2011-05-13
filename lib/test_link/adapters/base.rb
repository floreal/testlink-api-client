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

require 'test_link/exceptions/empty_response_exception'
require 'test_link/exceptions/command_failed_exception'
require 'test_link/exceptions/error_response_exception'

module TestLink
  module Adapters
    class Base
      attr_accessor :response

      def adapt
        raise TestLink::Exceptions::EmptyResponseException.new if response.nil? || response.empty?
        raise TestLink::Exceptions::CommandFailedException.new response['msg'] if (response.instance_of? Hash) && (response['status_ok'] == 0)
        response.map do |row|
          raise TestLink::Exceptions::ErrorResponseException.new row['message'], row['code'] if row.keys.include? 'code'
          adapt_row row
        end
      end
    end
  end
end
