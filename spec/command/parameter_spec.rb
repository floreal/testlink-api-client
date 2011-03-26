require "command/parameter"

describe TestLink::Command::Parameter do

  before :each do
    @parameter =  TestLink::Command::Parameter.new :my_param
  end

  it 'has a name' do
    @parameter.should respond_to :name
  end

  it 'has a default value' do
    @parameter.should respond_to :default
  end

  it 'may be mandatory' do
    @parameter.should respond_to :mandatory?
  end

  describe 'default state' do
    describe 'default value' do
      it 'is nil' do
        @parameter.default.should be_nil
      end
    end

    it 'is not mandatory' do
      @parameter.mandatory?.should be_false
    end
  end
end