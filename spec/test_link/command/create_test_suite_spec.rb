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

require "test_link/command/create_test_suite"
require "test_link/adapters/status_adapter"

describe TestLink::Command::CreateTestSuite do
  it "is a command" do
    (TestLink::Command::CreateTestSuite < TestLink::Command::Base).should be_true
  end

  it "adds a createTestSuite method to TestLink::ApiLink" do
    TestLink::ApiLink.new('http://qa.example.com/', '').should respond_to :createTestSuite
  end

  describe 'adapter' do
    it 'is a TestLink::Adapters::StatusAdapter' do
      TestLink::ApiLink.adapter_for(TestLink::Command::CreateTestSuite.command_name).should be_instance_of  TestLink::Adapters::StatusAdapter
    end
  end

  describe 'arguments' do
    before :each do
      @command = TestLink::Command::CreateTestSuite.new
    end

    it 'contain mandatory testprojectid' do
      @command.should provide_mandatory_argument :testprojectid
    end

    it 'contain mandatory testsuitename' do
      @command.should provide_mandatory_argument :testsuitename
    end

    it 'contain mandatory details' do
      @command.should provide_mandatory_argument :details
    end

    it 'contain checkduplicatedname' do
      @command.should provide_argument :checkduplicatedname
    end

    it 'contain actiononduplicatedname' do
      @command.should provide_argument :actiononduplicatedname
    end

    it 'contain parentid' do
      @command.should provide_argument :parentid
    end

    it 'contain order' do
      @command.should provide_argument :order
    end
  end
end