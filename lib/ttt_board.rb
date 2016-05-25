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
    get_cell(x, y).value = value
  end

  def cell_available?(x, y)
    get_cell(x, y).value != "X" && get_cell(x, y).value != "O"
  end

  def valid_cell_number?(cell_number)
    cell_number >= 1 && cell_number <= grid_size ** 2
  end

  # fix
  def game_grid
    @current = 0
    grid.each do |row|
      puts row.map { |cell| cell.value.empty? ? "-" : cell.value }.join(" | ")
    end
  end
  # /fix

  def draw?
    grid.flatten.map.all? { |cell| cell.value != "" } && !win?
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
