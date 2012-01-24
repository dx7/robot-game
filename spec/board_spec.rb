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

  describe "#col=" do
    it "return col" do
      board = Board.new(1, 1)
      result = board.col=(1)
      result.should == 1
    end
    it "raise error if new col is 0" do
      board = Board.new(1, 1)
      expect { board.col = 0 }.to raise_error(BoardColOutOfBoundsException)
    end
    it "raise error if new col is less than 0" do
      board = Board.new(1, 1)
      expect { board.col = -2 }.to raise_error(BoardColOutOfBoundsException)
    end
    it "raise error if new col is greater than cols" do
      board = Board.new(1, 1)
      expect { board.col = 2 }.to raise_error(BoardColOutOfBoundsException)
    end
  end

  describe "#row" do
    it "return row" do
      board = Board.new(5, 5)
      board.row = 3
      board.row.should == 3
    end
  end

  describe "#col" do
    it "return col" do
      board = Board.new(5, 5)
      board.col = 3
      board.col.should == 3
    end
  end
end
