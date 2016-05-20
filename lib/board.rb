require_relative 'cell.rb'
require_relative 'array_extension.rb'

class Board < Array

  attr_reader :grid, :grid_size

  def initialize(grid_size, input = {})
    @grid_size = grid_size
    @grid = input.fetch(:grid, initialize_grid(grid_size))
  end

  def initialize_grid(grid_size)
    Array.new(grid_size) { Array.new(grid_size) { Cell.new } }
  end

  def get_cell(x, y)
    grid[x][y]
  end

  def write_cell(x, y, value)
    get_cell(x, y).value = value
  end

  def cell_available?(x, y)
    get_cell(x, y).value != "X" && get_cell(x, y).value != "O"
  end

  def valid_cell_number?(cell_number)
    max = grid_size * grid_size
    cell_number >= 1 && cell_number <= max
  end

  def game_grid
    current = 0
    grid.each do |row|
      puts row.map { |cell| cell.value.empty? ? "-" : cell.value }.join(" | ")
    end
  end

  def draw?
    grid.flatten.map { |cell| cell.value }.none_empty?
  end

  def win?
    winning_situations.each do |winning_situation|
      if winning_situation_values(winning_situation).all_empty?
        next
      elsif winning_situation_values(winning_situation).all_same?
        return true
      end
    end
    false
  end


  private

  def winning_situation_values(winning_situation)
    winning_situation.map { |cell| cell.value }
  end

  def winning_situations
    grid + grid.transpose + diagonals
  end

  def diagonals
    diagonals_array = []
    left_diagonal_array = []
    right_diagonal_array = []
    (0...grid_size).each do |coordinate|
      left_diagonal_array << get_cell(coordinate, coordinate)
      right_diagonal_array << get_cell(coordinate, (grid_size-1)-coordinate)
    end
    diagonals_array << left_diagonal_array
    diagonals_array << right_diagonal_array
  end
end
