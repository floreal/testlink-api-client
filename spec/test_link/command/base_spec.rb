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

require "test_link/command/base"
require "test_link/api_link"

describe TestLink::Command::Base do
  before :each do
    @command = TestLink::Command::Base.new
  end

  describe 'Arguments' do
    it 'can be defined' do
      expect(TestLink::Command::Base).to respond_to :argument
    end

    it 'has an argument list' do
      expect(TestLink::Command::Base).to respond_to :arguments
    end

    it 'has dev_key mandatory argument' do
      expect(TestLink::Command::Base.arguments[:devKey].mandatory?).to be_truthy
      expect(@command).to provide :devKey
    end
  end

  describe 'Classname' do
    it 'helps to retrieve remote command name the first letter becomes lower case' do
      expect(TestLink::Command::Base.command_name).to eq 'base'
    end
  end

  describe 'Execution' do
    before :each do
      @key = '___dev-key___'
      @link = TestLink::ApiLink.new 'http://qa.example.com/', @key
      @link.client.stub(:call)
    end

    it 'calls a remote method' do
      expect(@link.client).to receive(:call).with('tl.base', :devKey => @key)
      @command.execute @link
    end

    it 'sets a default developer key given by the link' do
      @command.execute @link
      expect(@command.devKey).to eq @key
      expect(@command.arguments_hash[:devKey]).to eq @key
    end

    it 'overrides the link\'s key if it is defined' do
      key = '___other-dev-key___'
      @command.devKey = key
      @command.execute @link
      expect(@command.devKey).to eq key
      expect(@command.arguments_hash[:devKey]).to eq key
    end

    it 'raise an ArgumentError when a mandatory is not set' do
      @link.key = nil
      expect { @command.execute @link }.to raise_exception ArgumentError, 'Missing mandatory argument(s) [:devKey]'
    end
  end

  it 'allows to reset arguments to defined values' do
    @command.reset_arguments_hash :devKey => (key = 'my_dev_key')
    expect(@command.devKey).to eq key
    expect(@command.arguments_hash[:devKey]).to eq key
  end

  it 'checks whether command can be executed' do
    expect(TestLink::Command::Base.new.check_arguments).to eq [:devKey]
  end

  it 'can add itself to TestLink::ApiLink' do
    expect(TestLink::Command::Base).to respond_to :remote_method
  end

  it 'defines it\'s adapter' do
    expect(TestLink::Command::Base).to respond_to :adapt_with
  end
end