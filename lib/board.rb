class BoardRowOutOfBoundsException < Exception; end

class Board
  attr_accessor :rows, :cols

  def initialize(rows, cols)
    self.rows = rows
    self.cols = cols
  end

  def row=(row)
    raise BoardRowOutOfBoundsException if row > self.rows || row <= 0
    @row = row
  end
end
