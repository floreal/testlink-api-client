require 'api_link'

describe TestLink::ApiLink do
  before :each do
    @url = 'http://qa.example.com'
    @key = 'f2a979d533cdd9761434bba60a88e4d8'
    @link = TestLink::ApiLink.new @url, @key
  end

  it 'has a server url' do
    @link.url.should == @url
  end

  it 'has an API key' do
    @link.key.should == @key
  end

  it 'has an API url' do
    @link.api_url.should == (@url + '/lib/api/xmlrpc.php')
  end

  it 'holds a XMLRPC client' do
    @link.client.should be_an_instance_of XMLRPC::Client
  end
end