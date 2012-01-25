require 'spec_helper'

describe RobotGame do
  def play_game(file_content)
    File.should_receive(:new).with(an_instance_of(String)).and_return(StringIO.new(file_content))
    game = RobotGame.new("file path")
    game.play
    game.result
  end

  it "rotate to right once" do
    moves = <<-EOF
      10 10
      5 5 N
      R
    EOF

    play_game(moves).should == "5 5 E"
  end

  it "rotate do left once" do
    moves = <<-EOF
      10 10
      5 5 N
      L
    EOF

    play_game(moves).should == "5 5 W"
  end

  it "rotate to right twice" do
    moves = <<-EOF
      10 10
      5 5 N
      RR
    EOF

    play_game(moves).should == "5 5 S"
  end

  it "rotate to left twice" do
    moves = <<-EOF
      10 10
      5 5 N
      LL
    EOF

    play_game(moves).should == "5 5 S"
  end

  it "move to N once" do
    moves = <<-EOF
      10 10
      5 5 N
      M
    EOF

    play_game(moves).should == "5 6 N"
  end

  it "move to E once" do
    moves = <<-EOF
      10 10
      5 5 N
      RM
    EOF

    play_game(moves).should == "6 5 E"
  end

  it "move to invalid Y" do
    moves = <<-EOF
      10 10
      1 10 N
      M
    EOF

    play_game(moves).should == "Move Error - Invalid Y position"
  end

  it "move to invalid X" do
    moves = <<-EOF
      10 10
      10 1 E
      M
    EOF

    play_game(moves).should == "Move Error - Invalid X position"
  end

  it "jump to 1 1" do
    moves = <<-EOF
      10 10
      5 5 N
      T 1 2
    EOF

    play_game(moves).should == "1 2 N"
  end

  it "jump to X position invalid" do
    moves = <<-EOF
      10 10
      5 5 N
      T 100 1
    EOF

    play_game(moves).should == "Move Error - Invalid X position"
  end

  it "jump to Y position invalid" do
    moves = <<-EOF
      10 10
      5 5 N
      T 1 -1
    EOF

    play_game(moves).should == "Move Error - Invalid Y position"
  end

  it "has malformed file - empty file" do
    moves = <<-EOF
    EOF

    play_game(moves).should == "Malformed File"
  end

  it "has malformed file - invalid orientation" do
    moves = <<-EOF
      10 10
      5 5 C
      R
    EOF

    play_game(moves).should == "Malformed File - Invalid orientation C"
  end

  it "has malformed file - invalid command" do
    moves = <<-EOF
      10 10
      5 5 N
      RLB
    EOF

    play_game(moves).should == "Malformed File - Invalid command B"
  end

  it "client example" do
    moves = <<-EOF
      10 10
      2 5 N
      LLRRMMMRLRMMM
      T 1 3
      LLRRMMRMMRM
    EOF

    play_game(moves).should == "2 1 W"
  end

  it "exec from command line properly" do
    `./bin/robot.rb ./spec/fixtures/input_01.txt`.should == "2 1 W\n"
  end

  it "exec from command line with error" do
    `./bin/robot.rb`.should == "===> File path is missing\n===> Use:\n     ruby bin/robot.rb path/to/file.txt\n"
  end

end
