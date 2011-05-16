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

require 'test_link/adapters/base'
require 'test_link/objects/node'

module TestLink
  module Adapters
    class NodeAdapter < Base

      def response= response
        if response.instance_of? Hash
          if response.has_key?('node_type_id')
            response = [ response ]
          elsif response.count > 1 && response.keys.reject { |key| key =~ /\A\d+?\z/ }.count == 0
            response = response.values
          end
        end
        super response
      end

      def adapt_row row
        node = TestLink::Objects::Node.new
        node.id = row['id'].to_i
        node.parent_id = row['parent_id'].to_i
        node.type_id = row['node_type_id'].to_i
        node.table = row['node_table'] if row.has_key? 'node_table'
        node.order = row['node_order'].to_i
        node.name = row['name']
        node.details = row['details'] if row.has_key? 'details'
        node
      end
    end
  end
end
