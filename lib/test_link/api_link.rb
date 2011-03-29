require 'xmlrpc/client'

module TestLink
  class ApiLink
    attr_accessor :url, :key
    attr_reader :client

    def initialize url, key
      @url = url
      @key = key
      @client = XMLRPC::Client.new2 self.api_url
    end

    def api_url
      @url + '/lib/api/xmlrpc.php'
    end
  end
end