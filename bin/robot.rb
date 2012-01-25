#!/usr/bin/env ruby
require File.expand_path("./lib/board")
require File.expand_path("./lib/robot")
require File.expand_path("./lib/exceptions")
include Orientation

class RobotGame

  def initialize(file_path)
    raise FilePathMissingException if file_path.nil?
    @main_actions = { 'L' => :left, 'R' => :right, 'M' => :move }
    @file = File.new(file_path)
  end

  def play
    @file.each do |line|
      line.strip!
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

        begin
          @board.orientation = Object.const_get(data[2])
        rescue
          @result = "Malformed File - Invalid orientation #{data[2]}"
          return
        end
      else
        if line.match /^T/
          data = line.split
          @robot.jump(data[1].to_i, data[2].to_i)
        else
          line.each_char do |char|
            begin
              @robot.send(@main_actions[char]) unless char.nil?
            rescue
              @result = "Malformed File - Invalid command #{char}"
            end
          end
        end
      end
    end
  rescue BoardRowOutOfBoundsException
    @result = "Move Error - Invalid Y position"
  rescue BoardColOutOfBoundsException
    @result = "Move Error - Invalid X position"
  end

  def result
    @result || "#{@board.col} #{@board.row} #{Orientation.name(@board.orientation)}"
  rescue
    "Malformed File"
  end
end

if __FILE__ == $0
  begin
    game = RobotGame.new(ARGV[0])
    game.play
    puts game.result
  rescue FilePathMissingException
    puts "===> File path is missing"
    puts "===> Use:"
    puts "     ruby bin/robot.rb path/to/file.txt"
  end
end
