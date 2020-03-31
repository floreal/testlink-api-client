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

require 'test_link/command/argument'

describe TestLink::Command::Argument do

  before :each do
    @argument =  TestLink::Command::Argument.new
  end

  it 'has a default value' do
    expect(@argument).to respond_to :default
  end

  it 'may be mandatory' do
    expect(@argument).to respond_to :mandatory?
  end

  describe 'default state' do
    describe 'default value' do
      it 'is nil' do
        expect(@argument.default).to be_nil
      end
    end

    it 'is not mandatory' do
      expect(@argument.mandatory?).to be_falsy
    end
  end
end