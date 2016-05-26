require_relative 'player.rb'

class Computer < Player
  def move
    while true
      rand_x = rand(@board.grid_size)
      rand_y = rand(@board.grid_size)
      if @board.get_cell(rand_x, rand_y) != "X" && @board.get_cell(rand_x, rand_y) != "O"
        @board.write_cell(rand_x, rand_y, letter)
        return
      end
    end
  end
end
