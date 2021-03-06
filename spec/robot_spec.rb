require 'spec_helper'

describe Robot do
  include Orientation

  let(:board) { Board.new(10, 10) }
  let(:robot) { Robot.new(board) }

  describe "#right" do
    it "change N to E" do
      board.orientation = N
      robot.right
      board.orientation.should == E
    end
    it "change E to S" do
      board.orientation = E
      robot.right
      board.orientation.should == S
    end
    it "change S to W" do
      board.orientation = S
      robot.right
      board.orientation.should == W
    end
    it "change W to N" do
      board.orientation = W
      robot.right
      board.orientation.should == N
    end
  end

  describe "#left" do
    it "change N to W" do
      board.orientation = N
      robot.left
      board.orientation.should == W
    end
    it "change W to S" do
      board.orientation = W
      robot.left
      board.orientation.should == S
    end
    it "change S to E" do
      board.orientation = S
      robot.left
      board.orientation.should == E
    end
    it "change E to N" do
      board.orientation = E
      robot.left
      board.orientation.should == N
    end
  end

  describe "#move" do
    context "valid positions" do
      before do
        board.row = 5
        board.col = 5
      end

      it "move one position to N" do
        board.orientation = N
        robot.board = board
        robot.move
        board.row.should == 6
        board.col.should == 5
      end
      it "move one position to S" do
        board.orientation = S
        robot.board = board
        robot.move
        board.row.should == 4
        board.col.should == 5
      end
      it "move one position to E" do
        board.orientation = E
        robot.board = board
        robot.move
        board.row.should == 5
        board.col.should == 6
      end
      it "move one position to W" do
        board.orientation = W
        robot.board = board
        robot.move
        board.row.should == 5
        board.col.should == 4
      end
    end

    context "invalid positions" do
      it "raise error when move to out of bounds to N" do
        board.orientation = N
        board.row = 10
        robot.board = board
        expect { robot.move }.to raise_error(BoardRowOutOfBoundsException)
      end
      it "raise error when move to out of bounds to S" do
        board.orientation = S
        board.row = 1
        robot.board = board
        expect { robot.move }.to raise_error(BoardRowOutOfBoundsException)
      end
      it "raise error when move to out of bounds to E" do
        board.orientation = E
        board.col = 10
        robot.board = board
        expect { robot.move }.to raise_error(BoardColOutOfBoundsException)
      end
      it "raise error when move to out of bounds to W" do
        board.orientation = W
        board.col = 1
        robot.board = board
        expect { robot.move }.to raise_error(BoardColOutOfBoundsException)
      end
    end
  end

  describe "#jump" do
    before do
      board.orientation = E
    end

    it "jump to position 1, 2" do
      robot.jump(2, 1)
      board.row.should == 1
      board.col.should == 2
    end
    it "raise error when jump to position 11, 2" do
      expect { robot.jump(2, 11) }.to raise_error(BoardRowOutOfBoundsException)
    end
    it "raise error when jump to position 1, 22" do
      expect { robot.jump(22, 1) }.to raise_error(BoardColOutOfBoundsException)
    end
  end

end
