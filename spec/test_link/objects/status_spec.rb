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

require 'test_link/objects/status'

describe TestLink::Objects::Status do

  before :each do
    @status = TestLink::Objects::Status.new
  end

  it "has an id" do
    @status.should provide :id
  end

  it "has a status" do
    @status.should provide :status
  end

  it "has a message" do
    @status.should provide :message
  end

  it "has an additional info" do
    @status.should provide :additional_info
  end

  it "refers to an operation" do
    @status.should provide :operation
  end
end