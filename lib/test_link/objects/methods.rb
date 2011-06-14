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


module TestLink
  module Objects
    module Methods
      def == other
        return false unless (self.instance_variables.count == other.instance_variables.count)
        diff = self.instance_variables.select { |prop|
          self.instance_variable_get(prop) != other.instance_variable_get(prop)
        }
        diff.empty?
      end
    end
  end
end