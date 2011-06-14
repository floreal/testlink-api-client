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
require "test_link/objects/node"

describe TestLink::Objects::Node do
  before :each do
    @test_suite = TestLink::Objects::Node.new
  end

  it "has an id" do
    @test_suite.should provide :id
  end

  it "has a parent_id" do
    @test_suite.should provide :parent_id
  end
  
  it "has a type_id" do
    @test_suite.should provide :type_id
  end
  
  it "has a table" do
    @test_suite.should provide :table
  end

  it "has a name" do
    @test_suite.should provide :name
  end

  it "has an order" do
    @test_suite.should provide :order
  end

  it "has details" do
    @test_suite.should provide :details
  end
end