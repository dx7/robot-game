require File.expand_path("./lib/orientation")
require File.expand_path("./lib/exceptions")

class Board
  include Orientation

  attr_reader :rows, :cols, :row, :col, :orientation

  def initialize(cols, rows)
    self.rows = rows
    self.cols = cols
  end

  def rows=(rows)
    raise BoardRowsInvalidException if rows <= 0
    @rows = rows
  end

  def cols=(cols)
    raise BoardColsInvalidException if cols <= 0
    @cols = cols
  end

  def row=(row)
    raise BoardRowOutOfBoundsException if row > self.rows || row <= 0
    @row = row
  end

  def col=(col)
    raise BoardColOutOfBoundsException if col > self.cols || col <= 0
    @col = col
  end

  def orientation=(orientation)
    raise InvalidOrientationException unless Orientation.all.include?(orientation)
    @orientation = orientation
  end
end
