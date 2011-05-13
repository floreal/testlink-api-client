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

require "test_link/adapters/project_adapter"
require "test_link/objects/project"

describe TestLink::Adapters::ProjectAdapter do
  before :each do
    @project_adapter = TestLink::Adapters::ProjectAdapter.new
  end

  it "inherits from TestLink::Adapters::Base" do
    (TestLink::Adapters::ProjectAdapter < TestLink::Adapters::Base).should be_true
  end

  it "should know how to adapt a single row of a response" do
    p_formation = TestLink::Objects::Project.new
    row = {"id"=> (p_formation.id = 203).to_s ,
         "notes"=> p_formation.notes = "",
         "color"=>"",
         "active"=>"1",
         "prefix"=> p_formation.prefix = "FOR",
         "tc_counter"=>"0",
         "is_public"=>"1",
         "options"=>"O:8:\"stdClass\":4:{s:19:\"requirementsEnabled\";s:1:\"1\";s:19:\"testPriorityEnabled\";s:1:\"1\";s:17:\"automationEnabled\";s:1:\"1\";s:16:\"inventoryEnabled\";b:0;}",
         "name"=> p_formation.name = 'Formation',
         "opt"=>{"requirementsEnabled"=>"1",
                 "testPriorityEnabled"=>"1",
                 "automationEnabled"=>"1",
                 "inventoryEnabled"=>false}}

    @project_adapter.adapt_row(row).should == p_formation
  end

  it "should should adapt raw response to Project objects" do
    p_formation = TestLink::Objects::Project.new
    p_val = TestLink::Objects::Project.new
    response = [
        {"id"=> (p_formation.id = 203).to_s ,
         "notes"=> p_formation.notes = "",
         "color"=>"",
         "active"=>"1",
         "prefix"=> p_formation.prefix = "FOR",
         "tc_counter"=>"0",
         "is_public"=>"1",
         "options"=>"O:8:\"stdClass\":4:{s:19:\"requirementsEnabled\";s:1:\"1\";s:19:\"testPriorityEnabled\";s:1:\"1\";s:17:\"automationEnabled\";s:1:\"1\";s:16:\"inventoryEnabled\";b:0;}",
         "name"=> p_formation.name = 'Formation',
         "opt"=>{"requirementsEnabled"=>"1",
                 "testPriorityEnabled"=>"1",
                 "automationEnabled"=>"1",
                 "inventoryEnabled"=>false}},
        {"id"=>(p_val.id = 1),
         "notes"=> p_val.notes = "",
         "color"=>"",
         "active"=>"1",
         "prefix"=> p_val.prefix = "TC185",
         "tc_counter"=>"74",
         "is_public"=>"1",
         "options"=>"O:8:\"stdClass\":4:{s:19:\"requirementsEnabled\";s:1:\"1\";s:19:\"testPriorityEnabled\";s:1:\"1\";s:17:\"automationEnabled\";s:1:\"1\";s:16:\"inventoryEnabled\";b:0;}",
         "name"=> p_val.name = "Validation TestLink",
         "opt"=>{"requirementsEnabled"=>"1",
                 "testPriorityEnabled"=>"1",
                 "automationEnabled"=>"1",
                 "inventoryEnabled"=>false}}]

    @project_adapter.response = response
    @project_adapter.adapt.should == [ p_formation, p_val ]
  end
end