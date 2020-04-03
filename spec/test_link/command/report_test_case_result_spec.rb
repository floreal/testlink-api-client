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

require "test_link/command/report_test_case_result"
require "test_link/adapters/status_adapter"

describe TestLink::Command::ReportTCResult do
  it "is a command" do
    expect(TestLink::Command::ReportTCResult).to be < TestLink::Command::Base
  end

  it "adds a reportTCResult method to TestLink::ApiLink" do
    expect(TestLink::ApiLink.new('http://qa.example.com/', '')).to respond_to :reportTCResult
  end

  describe 'adapter' do
    it 'is a TestLink::Adapters::StatusAdapter' do
      expect(TestLink::ApiLink.adapter_for(TestLink::Command::ReportTCResult.command_name)).to be_instance_of  TestLink::Adapters::StatusAdapter
    end
  end

  describe 'arguments' do
    before :each do
      @command = TestLink::Command::ReportTCResult.new
    end

    it 'contain mandatory testcaseid' do
      expect(@command).to provide_mandatory_argument :testcaseid
    end

    it 'contain mandatory testplanid' do
      expect(@command).to provide_mandatory_argument :testplanid
    end

    it 'contain mandatory status' do
      expect(@command).to provide_mandatory_argument :status
    end

    it 'contain buildid' do
      expect(@command).to provide_argument :buildid
    end

    it 'contain buildname' do
      expect(@command).to provide_argument :buildname
    end

    it 'contain notes' do
      expect(@command).to provide_argument :notes
    end

    it 'contain guess' do
      expect(@command).to provide_argument :bugid
    end

    it 'contain platformid' do
      expect(@command).to provide_argument :platformid
    end

    it 'contain platformname' do
      expect(@command).to provide_argument :platformname
    end

    it 'contain customfields' do
      expect(@command).to provide_argument :customfields
    end
  end
end