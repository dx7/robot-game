class Robot
  attr_accessor :board

  def initialize(board)
    self.board = board
  end

  def right
    rotate(1)
  end

  def left
    rotate(-1)
  end

  def move
    if board.orientation.even?
      board.row += -(board.orientation - 1)
    else
      board.col += -(board.orientation - 2)
    end
  end

  def jump(row, col)
    board.row = row
    board.col = col
  end

  private

    def rotate(const)
      self.board.orientation = (board.orientation + const).modulo 4
    end
end
