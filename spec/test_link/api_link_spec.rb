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

require 'test_link/api_link'
require 'test_link/command/base'

describe TestLink::ApiLink do
  before :each do
    @url = 'http://qa.example.com'
    @key = '__dev_key__'
    @link = TestLink::ApiLink.new @url, @key
  end

  it 'has a server url' do
    expect(@link.url).to eq @url
  end

  it 'has an API key' do
    expect(@link.key).to eq @key
  end

  it 'has an API url' do
    expect(@link.api_url).to eq(@url + '/lib/api/xmlrpc.php')
  end

  it 'holds a XMLRPC client' do
    expect(@link.client).to be_an_instance_of XMLRPC::Client
  end

  it 'allows to add remote methods' do
    expect(TestLink::ApiLink).to respond_to :remote_method
  end

  it 'allows to define an adapter for each remote method' do
    expect(TestLink::ApiLink).to respond_to :set_adapter_for
  end

  describe 'Adding remote method support' do
    before :all do
      class TestLink::ApiLink
        def self.remote_methods
          @@remote_methods
        end
      end

      class FooAdapter
        attr_accessor :response
        def adapt
        end
      end

      class Foo < TestLink::Command::Base
        adapt_with FooAdapter

        def command_name
          'foo'
        end

        def execute link
          [{}]
        end
      end

      TestLink::ApiLink.remote_method Foo
    end

    it 'finds out the name of the method with class command_name method' do
      link = TestLink::ApiLink.new('http://qa.example.com/', '')
      expect(link).to respond_to :foo
    end

    it 'registers a new class instance with the command symbol' do
      expect(TestLink::ApiLink.remote_methods[:foo]).to be_an_instance_of Foo
    end

    describe 'execution' do
      before :each do
        @link = TestLink::ApiLink.new('http://qa.example.com/', '___dev_key___')
      end

      it 'calls the registered command class execute method with parameters' do
        args = {:foo => 'bar', :baz => 42}
        foo = TestLink::ApiLink.remote_methods[:foo]
        allow(foo).to receive(:execute).with(@link)
        allow(foo).to receive(:reset_arguments_hash).with(args)
        @link.foo args
      end

      it 'uses the command specified adapter' do
        expect(TestLink::ApiLink.adapter_for(Foo.command_name.to_sym)).to be_an_instance_of FooAdapter
      end
    end
  end
end