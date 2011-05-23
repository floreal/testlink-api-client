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

require "test_link/command/create_test_case"
require "test_link/adapters/status_adapter"

describe TestLink::Command::CreateTestCase do
  it "is a command" do
    TestLink::Command::CreateTestCase.should < TestLink::Command::Base
  end

  it "adds a createTestSuite method to TestLink::ApiLink" do
    TestLink::ApiLink.new('http://qa.example.com/', '').should respond_to :createTestCase
  end

  describe 'adapter' do
    it 'is a TestLink::Adapters::StatusAdapter' do
      TestLink::ApiLink.adapter_for(TestLink::Command::CreateTestCase.command_name).should be_instance_of  TestLink::Adapters::StatusAdapter
    end
  end

  describe 'arguments' do
    before :each do
      @command = TestLink::Command::CreateTestCase.new
    end

    it 'contain mandatory testcasename' do
      @command.should provide_mandatory_argument :testcasename
    end

    it 'contain mandatory testsuiteid' do
      @command.should provide_mandatory_argument :testsuiteid
    end

    it 'contain mandatory testprojectid' do
      @command.should provide_mandatory_argument :testprojectid
    end

    it 'contain mandatory authorlogin' do
      @command.should provide_mandatory_argument :authorlogin
    end

    it 'contain mandatory summary' do
      @command.should provide_mandatory_argument :summary
    end

    it 'contain mandatory steps' do
      @command.should provide_mandatory_argument :steps
    end

    it 'contain preconditions' do
          @command.should provide_argument :preconditions
    end

    it 'contain importance' do
      @command.should provide_argument :importance
    end

    it 'contain execution' do
      @command.should provide_argument :execution
    end

    it 'contain order' do
      @command.should provide_argument :order
    end

    it 'contain checkduplicatedname' do
      @command.should provide_argument :checkduplicatedname
    end

    it 'contain actiononduplicatedname' do
      @command.should provide_argument :actiononduplicatedname
    end

  end
end