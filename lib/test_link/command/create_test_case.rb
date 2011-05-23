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

require 'test_link/command/base'
require 'test_link/adapters/status_adapter'

module TestLink
  module Command
    class CreateTestCase < Base
      remote_method

      argument :testcasename, :mandatory => true
      argument :testsuiteid, :mandatory => true
      argument :testprojectid, :mandatory => true
      argument :authorlogin, :mandatory => true
      argument :summary, :mandatory => true
      argument :steps, :mandatory => true
      argument :preconditions
      argument :importance
      argument :execution
      argument :order
      argument :checkduplicatedname
      argument :actiononduplicatedname

      adapt_with Adapters::StatusAdapter
    end
  end
end
