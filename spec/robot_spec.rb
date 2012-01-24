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

end
