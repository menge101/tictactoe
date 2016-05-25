require_relative 'player.rb'

class HumanPlayer < Player
  def move(x, y, value)
    @board.write_cell(x, y, value)
  end
end
