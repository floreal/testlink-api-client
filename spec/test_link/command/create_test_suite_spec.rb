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

require "test_link/command/create_test_suite"
require "test_link/adapters/status_adapter"

describe TestLink::Command::CreateTestSuite do
  it "is a command" do
    expect(TestLink::Command::CreateTestSuite < TestLink::Command::Base).to be_truthy
  end

  it "adds a createTestSuite method to TestLink::ApiLink" do
    expect(TestLink::ApiLink.new('http://qa.example.com/', '')).to respond_to :createTestSuite
  end

  describe 'adapter' do
    it 'is a TestLink::Adapters::StatusAdapter' do
      expect(TestLink::ApiLink.adapter_for(TestLink::Command::CreateTestSuite.command_name)).to be_instance_of  TestLink::Adapters::StatusAdapter
    end
  end

  describe 'arguments' do
    before :each do
      @command = TestLink::Command::CreateTestSuite.new
    end

    it 'contain mandatory testprojectid' do
      expect(@command).to provide_mandatory_argument :testprojectid
    end

    it 'contain mandatory testsuitename' do
      expect(@command).to provide_mandatory_argument :testsuitename
    end

    it 'contain mandatory details' do
      expect(@command).to provide_mandatory_argument :details
    end

    it 'contain checkduplicatedname' do
      expect(@command).to provide_argument :checkduplicatedname
    end

    it 'contain actiononduplicatedname' do
      expect(@command).to provide_argument :actiononduplicatedname
    end

    it 'contain parentid' do
      expect(@command).to provide_argument :parentid
    end

    it 'contain order' do
      expect(@command).to provide_argument :order
    end
  end
end