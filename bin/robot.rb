#!/usr/bin/env ruby
require File.expand_path("./lib/board")
require File.expand_path("./lib/robot")
include Orientation

class RobotGame

  def initialize(file_path)
    @main_actions = { 'L' => :left, 'R' => :right, 'M' => :move }
    @file = File.new(file_path)
  end

  def play
    @file.each do |line|
      line_number = @file.lineno

      case line_number
        when 1 then
          data = line.split
          @board = Board.new(data[0].to_i, data[1].to_i)
          @robot = Robot.new(@board)
        when 2 then
          data = line.split
          @board.col = data[0].to_i
          @board.row = data[1].to_i
          @board.orientation = Object.const_get(data[2])
        else
          if line.match /^T/
            data = line.split
            @robot.jump(data[1].to_i, data[2].to_i)
          else
            line.strip.each_char do |char|
              @robot.send(@main_actions[char]) unless char.nil?
          end
        end
      end
    end
  end

  def result
    "#{@board.col} #{@board.row} #{Orientation.name(@board.orientation)}"
  end
end

game = RobotGame.new(ARGV[0])
game.play
puts game.result
