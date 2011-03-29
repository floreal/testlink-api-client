require 'test_link/command/argument'

describe TestLink::Command::Argument do

  before :each do
    @argument =  TestLink::Command::Argument.new
  end

  it 'has a default value' do
    @argument.should respond_to :default
  end

  it 'may be mandatory' do
    @argument.should respond_to :mandatory?
  end

  describe 'default state' do
    describe 'default value' do
      it 'is nil' do
        @argument.default.should be_nil
      end
    end

    it 'is not mandatory' do
      @argument.mandatory?.should be_false
    end
  end
end