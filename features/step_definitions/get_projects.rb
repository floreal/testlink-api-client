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

Given /^a remote api containing those projects:$/ do |table|
  @remote_data = table.hashes.map do |row|
    {
      "id"=> row['id'].to_s ,
       "notes"=> row['notes'].to_s,
       "color"=>"",
       "active"=>"1",
       "prefix"=> row['prefix'].to_s,
       "tc_counter"=>"0",
       "is_public"=>"1",
       "options"=>"O:8:\"stdClass\":4:{s:19:\"requirementsEnabled\";s:1:\"1\";s:19:\"testPriorityEnabled\";s:1:\"1\";s:17:\"automationEnabled\";s:1:\"1\";s:16:\"inventoryEnabled\";b:0;}",
       "name"=> row['name'].to_s,
       "opt"=>{"requirementsEnabled"=>"1",
               "testPriorityEnabled"=>"1",
               "automationEnabled"=>"1",
               "inventoryEnabled"=>false}}
  end
end

When /^remote call for getProjects returns remote data previously set$/ do
  @tl.client.stub!(:call).with("tl.getProjects", :devKey => @key).and_return(@remote_data)
end

When /^remote call returns an error (\d+?): "(.+?)"$/ do |code, message|
  @code = code
  @message = message
  @tl.client.stub!(:call).and_return([{'code' => @code, 'message' => @message}])
end

Then /^I get this Project list:$/ do |table|
  expect(@result).to eq table.hashes.map { |row|
    project = TestLink::Objects::Project.new
    project.id = row['id'].to_i
    project.notes = row['notes'].to_s
    project.prefix = row['prefix'].to_s
    project.name = row['name'].to_s
    project
  }
end


