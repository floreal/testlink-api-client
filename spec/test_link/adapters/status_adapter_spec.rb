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

require "test_link/adapters/status_adapter"
require "test_link/objects/status"

describe TestLink::Adapters::StatusAdapter do
  before :each do
    @status_adapter = TestLink::Adapters::StatusAdapter.new
  end

  it "inherits from TestLink::Adapters::Base" do
    expect(TestLink::Adapters::StatusAdapter).to be < TestLink::Adapters::Base
  end

  it "knows how to adapt a single row of a response" do
    status = TestLink::Objects::Status.new
    row = {
        "id"=> (status.id = 2).to_s,
        "status" => status.status = true,
        "operation" => status.operation = "createTestSuite",
        "additionalInfo" => status.additional_info = "some more infos",
        "message" => status.message = "ok"}
    expect(@status_adapter.adapt_row(row)).to eq status
  end

  it "should should adapt raw response to Status objects" do
    status = TestLink::Objects::Status.new
    response = [{
        "id"=> (status.id = 2).to_s,
        "status" => status.status = true,
        "operation" => status.operation = "createTestSuite",
        "additionalInfo" => status.additional_info = "some more infos",
        "message" => status.message = "ok"}]

    @status_adapter.response = response
    expect(@status_adapter.adapt).to eq [ status ]
  end
end