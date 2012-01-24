require 'spec_helper'

describe Board do
  include Orientation

  let(:board) { Board.new(10, 10) }

  describe "#initialize" do
    it "set rows and cols" do
      board.rows.should == 10
      board.cols.should == 10
    end
  end

  describe "#rows=" do
    it "return rows" do
      result = board.rows=(1)
      result.should == 1
    end
    it "raise error if rows is 0" do
      expect { board.rows = 0 }.to raise_error(BoardRowsInvalidException)
    end
    it "raise error if rows is less than 0" do
      expect { board.rows = -2 }.to raise_error(BoardRowsInvalidException)
    end
  end

  describe "#cols=" do
    it "return cols" do
      result = board.cols=(1)
      result.should == 1
    end
    it "raise error if cols is 0" do
      expect { board.cols = 0 }.to raise_error(BoardColsInvalidException)
    end
    it "raise error if cols is less than 0" do
      expect { board.cols = -2 }.to raise_error(BoardColsInvalidException)
    end
  end

  describe "#row=" do
    it "return row" do
      result = board.row=(1)
      result.should == 1
    end
    it "raise error if new row is 0" do
      expect { board.row = 0 }.to raise_error(BoardRowOutOfBoundsException)
    end
    it "raise error if new row is less than 0" do
      expect { board.row = -2 }.to raise_error(BoardRowOutOfBoundsException)
    end
    it "raise error if new row is greater than rows" do
      expect { board.row = 11 }.to raise_error(BoardRowOutOfBoundsException)
    end
  end

  describe "#col=" do
    it "return col" do
      result = board.col=(1)
      result.should == 1
    end
    it "raise error if new col is 0" do
      expect { board.col = 0 }.to raise_error(BoardColOutOfBoundsException)
    end
    it "raise error if new col is less than 0" do
      expect { board.col = -2 }.to raise_error(BoardColOutOfBoundsException)
    end
    it "raise error if new col is greater than cols" do
      expect { board.col = 11 }.to raise_error(BoardColOutOfBoundsException)
    end
  end

  describe "#orientation=" do
    it "set and return 'N' orientation" do
      result = board.orientation=(N)
      result.should == N
    end
    it "set and return 'S' orientation" do
      result = board.orientation=(S)
      result.should == S
    end
    it "set and return 'E' orientation" do
      result = board.orientation=(E)
      result.should == E
    end
    it "set and return 'W' orientation" do
      result = board.orientation=(W)
      result.should == W
    end
    it "raise error when orientation is invalid" do
      expect { board.orientation=('T') }.to raise_error(InvalidOrientationException)
    end
  end

  describe "#row" do
    it "return row" do
      board.row = 3
      board.row.should == 3
    end
  end

  describe "#col" do
    it "return col" do
      board.col = 3
      board.col.should == 3
    end
  end

  describe "#orientation" do
    it "return orientation" do
      board.orientation = N
      board.orientation.should == N
    end
  end
end
