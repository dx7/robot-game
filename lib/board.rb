class BoardRowOutOfBoundsException < Exception; end

class Board
  attr_accessor :rows, :cols
  attr_reader :row, :col

  def initialize(rows, cols)
    self.rows = rows
    self.cols = cols
  end

  def row=(row)
    raise BoardRowOutOfBoundsException if row > self.rows || row <= 0
    @row = row
  end

  def col=(col)
    raise BoardColOutOfBoundsException if col > self.cols || col <= 0
    @col = col
  end
end
