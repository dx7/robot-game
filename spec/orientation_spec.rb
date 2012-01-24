require 'spec_helper'

describe Orientation do
  it 'has N constant' do
    Orientation::N.should == 0
  end
  it 'has E constant' do
    Orientation::E.should == 1
  end
  it 'has S constant' do
    Orientation::S.should == 2
  end
  it 'has W constant' do
    Orientation::W.should == 3
  end
  it 'return all orientations' do
    Orientation.all.should == [0, 1, 2, 3]
  end
end
