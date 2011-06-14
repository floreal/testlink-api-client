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

require 'test_link/command/get_test_suites_for_test_suite'
require 'test_link/adapters/node_adapter'

describe TestLink::Command::GetTestSuitesForTestSuite do
  it "is a command" do
    TestLink::Command::GetTestSuitesForTestSuite.should < TestLink::Command::Base
  end

  it "adds a getTestSuitesForTestSuite method to TestLink::ApiLink" do
    TestLink::ApiLink.new('http://qa.example.com/', '').should respond_to :getTestSuitesForTestSuite
  end

  describe 'adapter' do
    it 'is a TestLink::Adapters::NodeAdapter' do
      TestLink::ApiLink.adapter_for(TestLink::Command::GetTestSuitesForTestSuite.command_name).should be_instance_of  TestLink::Adapters::NodeAdapter
    end
  end

  describe 'arguments' do
    before :each do
      @command = TestLink::Command::GetTestSuitesForTestSuite.new
    end

    it 'contain mandatory testsuiteid' do
      @command.should provide_mandatory_argument :testsuiteid
    end
  end
end