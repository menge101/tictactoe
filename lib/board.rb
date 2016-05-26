class Board
  attr_accessor :grid_size

  def initialize(grid_size)
    @grid_size = grid_size
  end

  def generate_board
    cell = 0
    Array.new(grid_size) { Array.new(grid_size) { "#{cell += 1}" } }
  end
end
