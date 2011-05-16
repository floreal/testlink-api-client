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

Given /^a TestLink Api link for "([^"]*)" with devKey "([^"]*)"$/ do |url, key|
  @key = key
  @tl = TestLink::ApiLink.new url, @key
end

Given /^a fresh database "([^"]*)"$/ do |sql_file|
  reset_db "#{sql_file}.sql"
end

When /^I use these parameters:$/ do |table|
  table.hashes.each do |pair|
    @parameters[pair['name'].to_sym] = pair['value']
  end
  @parameters
end

When /^I call "([^"]*)"$/ do |method|
  begin
    @result = @tl.send(method.to_sym, @parameters)
  rescue TestLink::Exceptions::Exception => error
    @error = error
  end
end

Then /^A response error exception is raised with a message "([^"]*)"$/ do |message|
  fail "Received a non error response \"#{@result}\" when expecting an error message: #{message}" if @error.nil?
  @error.class.should < TestLink::Exceptions::Exception
  @error.message.should == message
end

Then /^I get status "([^"]*)" for "([^"]*)" with additionalInfo "([^"]*)" and message "([^"]*)"$/ do |status, operation, info, message|
  fail "Received an error \"#{@error}\" when expecting a success" unless @error.nil?
  @result.count.should == 1
  returned_status = @result.first
  returned_status.should be_instance_of TestLink::Objects::Status
  returned_status.status.should == string2boolean(status)
  returned_status.operation.should == operation
  returned_status.additional_info.should == info
  returned_status.message.should == message
end

Then /^I get this node list:$/ do |table|
  @result.should == table.hashes.map { |row|
    node = TestLink::Objects::Node.new
    node.id = row['id'].to_i
    node.parent_id = row['parent_id'].to_i
    node.type_id = row['type_id'].to_i
    node.table = row['table'].to_s
    node.order = row['order'].to_i
    node.name = row['name'].to_s
    node
  }
end