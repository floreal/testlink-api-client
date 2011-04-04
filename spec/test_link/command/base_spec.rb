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

require "test_link/command/base"

describe TestLink::Command::Base do
  describe 'Arguments' do
    it 'can be defined' do
      TestLink::Command::Base.should respond_to :argument
    end

    it 'has an argument list' do
      TestLink::Command::Base.should respond_to :arguments
    end

    it 'has dev_key mandatory argument' do
      @command = TestLink::Command::Base.new
      TestLink::Command::Base.arguments[:devKey].mandatory?.should be_true
      @command.should respond_to :devKey
      @command.should respond_to :devKey=
    end
  end

  describe 'Classname' do
    it 'helps to retrieve remote command name the first letter becomes lower case' do
      TestLink::Command::Base.command_name.should == 'base'
    end
  end
end