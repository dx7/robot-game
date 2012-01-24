module Orientation
  N = 0
  E = 1
  S = 2
  W = 3

  def self.all
    [N, E, S, W]
  end

  def self.name(number)
    ['N', 'E', 'S', 'W'][number]
  end
end
