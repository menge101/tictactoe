require_relative 'player.rb'

class HumanPlayer < Player
  def move
    ui.player_move_message(name, letter)
    x, y = human_coordinates
    board.write_cell(x, y, letter)
  end


  private

  def human_coordinates
    cell_number = get_cell_number
    x, y = board.number_to_coordinates(cell_number)
    until board.cell_available?(x, y)
      ui.print_message("Cell unavailable. Try again")
      cell_number = get_cell_number
      x, y = board.number_to_coordinates(cell_number)
    end
    return x, y
  end

  def get_cell_number
    cell_number = ui.get_move
    until board.valid_cell_number?(cell_number)
      print_message("Invalid cell number. Try again")
      cell_number = ui.get_move
    end
    cell_number
  end
end
