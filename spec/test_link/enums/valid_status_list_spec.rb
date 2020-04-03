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

require 'test_link/enums/valid_status_list'

describe TestLink::Enums::ValidStatusList do

  before :each do
    @status = TestLink::Enums::ValidStatusList
  end

  it "encoding values" do
    expect(@status::FAILED).to eq('f') 
    expect(@status::BLOCKED).to eq('b')
    expect(@status::PASSED).to eq('p')
    expect(@status::NOT_RUN).to eq('n')
    expect(@status::NOT_AVAILABLE).to eq('x')
    expect(@status::UNKNOWN).to eq('u')
    expect(@status::ALL).to eq('a')
  end

end