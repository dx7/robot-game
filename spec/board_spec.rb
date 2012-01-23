require 'spec_helper'

describe Board do
  describe "#initialize" do
    it "set rows and cols" do
      board = Board.new(10, 10)
      board.rows.should == 10
      board.cols.should == 10
    end
  end

  describe "#row=" do
    it "return row" do
      board = Board.new(1, 1)
      result = board.row=(1)
      result.should == 1
    end
    it "raise error if new row is 0" do
      board = Board.new(1, 1)
      expect { board.row = 0 }.to raise_error(BoardRowOutOfBoundsException)
    end
    it "raise error if new row is less than 0" do
      board = Board.new(1, 1)
      expect { board.row = -2 }.to raise_error(BoardRowOutOfBoundsException)
    end
    it "raise error if new row is greater than rows" do
      board = Board.new(1, 1)
      expect { board.row = 2 }.to raise_error(BoardRowOutOfBoundsException)
    end
  end
end
