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

  private

    def rotate(const)
      self.board.orientation = (board.orientation + const).modulo 4
    end
end
