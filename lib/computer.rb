require_relative 'player.rb'

class Computer < Player
  def move
    while true
      random_cell = rand(1..board.grid_size**2)
      x, y = board.number_to_coordinates(random_cell)
      if board.cell_available?(x, y)
        board.write_cell(x, y, letter)
        ui.print_message("Computer has placed #{letter} in cell #{random_cell}")
        return
      end
    end
  end
end
