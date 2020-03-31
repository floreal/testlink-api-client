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

require "test_link/command/get_projects"
require "test_link/adapters/project_adapter"

describe TestLink::Command::GetProjects do
  it "is a command" do
    expect(TestLink::Command::GetProjects).to be < TestLink::Command::Base
  end

  it "adds a getProjects method to TestLink::ApiLink" do
    expect(TestLink::ApiLink.new('http://qa.example.com/', '')).to respond_to :getProjects
  end

  describe 'adapter' do
    it 'is a TestLink::Adapters::ProjectAdapter' do
      expect(TestLink::ApiLink.adapter_for(TestLink::Command::GetProjects.command_name)).to be_instance_of  TestLink::Adapters::ProjectAdapter
    end
  end
end