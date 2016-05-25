require_relative 'cell.rb'

class Board
  attr_reader :grid_size

  def initialize(grid_size)
    @grid_size = grid_size
  end

  def generate_board
    Array.new(grid_size) { Array.new(grid_size) { Cell.new } }
  end
end
