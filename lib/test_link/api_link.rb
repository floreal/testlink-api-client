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

require 'xmlrpc/client'

module TestLink
  class ApiLink
    attr_accessor :url, :key
    attr_reader :client
    @@remote_methods = {}

    def initialize(url, key)
      @url = url
      @key = key
      @client = XMLRPC::Client.new2 self.api_url
    end

    def api_url()
      @url + '/lib/api/xmlrpc.php'
    end

    def self.remote_method(klass)
      method_name = klass.command_name.to_sym
      @@remote_methods[method_name] = klass.new
    end

    def respond_to_missing?(symbol, include_private)
      return true if @@remote_methods.include? symbol
      super symbol, include_private
    end

    def method_missing(symbol, *args)
      command = @@remote_methods[symbol]
      super(symbol, args) if command.nil?
      command.reset_arguments_hash args.first
      command.execute self
    end
  end
end