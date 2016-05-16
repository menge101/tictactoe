class Board

  attr_reader :grid

  def initialize
    @grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def write_cell(x, y, value)
    grid[x][y] = value
  end

  def get_cell(x, y)
    grid[x][y]
  end

  def cell_available?(x, y)
    get_cell(x, y) != 'X' && get_cell(x, y) != 'O'
  end

  def horizontals
    grid[0].uniq.length == 1 || grid[1].uniq.length == 1 || grid[2].uniq.length == 1
  end

  def verticals
    left_vertical || mid_vertical || right_vertical
  end

  def diagonals
    top_left_bottom_right_diagonal || top_right_bottom_left_diagonal
  end

  def number_to_coordinates(cell_number)
    mapping = {
      1 => [0, 0],
      2 => [0, 1],
      3 => [0, 2],
      4 => [1, 0],
      5 => [1, 1],
      6 => [1, 2],
      7 => [2, 0],
      8 => [2, 1],
      9 => [2, 2]
    }
    mapping[cell_number]
  end

  def valid_cell_number(cell_number)
    cell_number >= 1 && cell_number <= 9
  end


  private

  def left_vertical
    grid[0][0] == grid[1][0] && grid[0][0] == grid[2][0] && grid[1][0] == grid[2][0]
  end

  def mid_vertical
    grid[0][1] == grid[1][1] && grid[0][1] == grid[2][1] && grid[1][1] == grid[2][1]
  end

  def right_vertical
    grid[0][2] == grid[1][2] && grid[0][2] == grid[2][2] && grid[1][2] == grid[2][2]
  end

  def top_left_bottom_right_diagonal
    grid[0][0] == grid[1][1] && grid[0][0] == grid[2][2] && grid[1][1] == grid[2][2]
  end

  def top_right_bottom_left_diagonal
    grid[0][2] == grid[1][1] && grid[0][2] == grid[2][0] && grid[1][1] == grid[2][0]
  end
end
