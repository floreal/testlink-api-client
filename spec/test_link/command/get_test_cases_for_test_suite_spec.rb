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

require "test_link/command/get_test_cases_for_test_suite"
require "test_link/adapters/status_adapter"

describe TestLink::Command::GetTestCasesForTestSuite do
  it "is a command" do
    expect(TestLink::Command::GetTestCasesForTestSuite).to be < TestLink::Command::Base
  end

  it "adds a GetTestCasesForTestSuite method to TestLink::ApiLink" do
    expect(TestLink::ApiLink.new('http://qa.example.com/', '')).to respond_to :getTestCasesForTestSuite
  end

  describe 'adapter' do
    it 'is a TestLink::Adapters::NodeAdapter' do
      expect(TestLink::ApiLink.adapter_for(TestLink::Command::GetTestCasesForTestSuite.command_name)).to be_instance_of  TestLink::Adapters::NodeAdapter
    end
  end

  describe 'arguments' do
    before :each do
      @command = TestLink::Command::GetTestCasesForTestSuite.new
    end

    it 'contain mandatory testsuiteid' do
      expect(@command).to provide_mandatory_argument :testsuiteid
    end

    it 'contain deep' do
      expect(@command).to provide_argument :deep
    end

    it 'contain details' do
      expect(@command).to provide_argument :details
    end

  end
end