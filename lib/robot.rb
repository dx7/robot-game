class Robot
  attr_accessor :board

  def initialize(board)
    self.board = board
  end

  def right
    self.board.orientation = (board.orientation + 1).modulo 4
  end

  def left
    self.board.orientation = (board.orientation - 1).modulo 4
  end
end
