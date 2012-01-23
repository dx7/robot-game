require 'spec_helper'

describe Board do
  describe "initialize" do
    it "set rows and cols" do
      board = Board.new(10, 10)
      board.rows.should == 10
      board.cols.should == 10
    end
  end
end
