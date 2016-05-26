require_relative 'board.rb'

class TTTBoard < Board
  attr_reader :grid, :grid_size

  def initialize(grid_size, input = {})
    @grid_size = grid_size
    @grid = input.fetch(:grid, generate_board)
  end

  def get_cell(x, y)
    grid[y][x]
  end

  def write_cell(x, y, value)
    grid[y][x] = value
  end

  def cell_available?(x, y)
    get_cell(x, y) != "X" && get_cell(x, y) != "O"
  end

  def valid_cell_number?(cell_number)
    cell_number >= 1 && cell_number <= grid_size ** 2
  end

  def game_grid
    grid.each do |row|
      puts row.map { |cell| cell }.join(" | ")
    end
  end

  def draw?
    grid.flatten.map.all? { |cell| cell == "X" || cell == "O" } && !win?
  end

  def win?
    winning_situations.each do |winning_situation|
      if winning_situation_values(winning_situation).all? { |cell| cell == "" }
        next
      elsif all_same?(winning_situation_values(winning_situation))
        return true
      end
    end
    false
  end


  private

  def all_same?(array)
    array.uniq.size <= 1
  end

  def winning_situation_values(winning_situation)
    winning_situation.map { |cell| cell }
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
