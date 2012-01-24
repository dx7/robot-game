require 'spec_helper'

describe Orientation do
  it 'has N constant' do
    Orientation::N.should == 'N'
  end
  it 'has S constant' do
    Orientation::S.should == 'S'
  end
  it 'has E constant' do
    Orientation::E.should == 'E'
  end
  it 'has W constant' do
    Orientation::W.should == 'W'
  end
  it 'return all orientations' do
    Orientation.all.should == ['N', 'S', 'E', 'W']
  end
end
