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

require "test_link/command/create_test_case"
require "test_link/adapters/status_adapter"

describe TestLink::Command::CreateTestCase do
  it "is a command" do
    expect(TestLink::Command::CreateTestCase).to be < TestLink::Command::Base
  end

  it "adds a createTestCase method to TestLink::ApiLink" do
    expect(TestLink::ApiLink.new('http://qa.example.com/', '')).to respond_to :createTestCase
  end

  describe 'adapter' do
    it 'is a TestLink::Adapters::StatusAdapter' do
      expect(TestLink::ApiLink.adapter_for(TestLink::Command::CreateTestCase.command_name)).to be_instance_of  TestLink::Adapters::StatusAdapter
    end
  end

  describe 'arguments' do
    before :each do
      @command = TestLink::Command::CreateTestCase.new
    end

    it 'contain mandatory testcasename' do
      expect(@command).to provide_mandatory_argument :testcasename
    end

    it 'contain mandatory testsuiteid' do
      expect(@command).to provide_mandatory_argument :testsuiteid
    end

    it 'contain mandatory testprojectid' do
      expect(@command).to provide_mandatory_argument :testprojectid
    end

    it 'contain mandatory authorlogin' do
      expect(@command).to provide_mandatory_argument :authorlogin
    end

    it 'contain mandatory summary' do
      expect(@command).to provide_mandatory_argument :summary
    end

    it 'contain mandatory steps' do
      expect(@command).to provide_mandatory_argument :steps
    end

    it 'contain preconditions' do
      expect(@command).to provide_argument :preconditions
    end

    it 'contain importance' do
      expect(@command).to provide_argument :importance
    end

    it 'contain execution' do
      expect(@command).to provide_argument :execution
    end

    it 'contain order' do
      expect(@command).to provide_argument :order
    end

    it 'contain checkduplicatedname' do
      expect(@command).to provide_argument :checkduplicatedname
    end

    it 'contain actiononduplicatedname' do
      expect(@command).to provide_argument :actiononduplicatedname
    end

  end
end