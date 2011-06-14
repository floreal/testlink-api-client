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

require 'xmlrpc/client'

module TestLink
  class ApiLink
    attr_accessor :key
    attr_reader :client, :url
    @@remote_methods = {}
    @@adapters = {}
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
      adapter = @@adapters[symbol]
      return super(symbol, args) if command.nil?
      command_args = args.first || {}
      command.reset_arguments_hash command_args
      adapter.response = command.execute self
      adapter.adapt
    end

    def self.set_adapter_for command_name, klass
      @@adapters[command_name.to_sym] = klass.new
    end

    def self.adapter_for(command_name)
      @@adapters[command_name.to_sym]
    end
  end
end