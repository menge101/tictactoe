class DummyUI

  attr_reader :input, :output

  def initialize(input=STDIN, output=STDOUT)
    @input = input
    @output = output
  end

  def get_input
    "hello"
  end

  def get_move
    3
  end

  def print_message(message)
    message
  end

  def get_player_name
    return "player1", "player2"
  end

  def get_grid_size
    3
  end

  def get_grid_size_message
    "enter grid size"
  end

  def invalid_grid_size_message
    "invalid grid size"
  end

  def unavailable_cell_message
    "unavailable cell"
  end

  def player_move_message(name, letter)
    "name and letter"
  end

  def invalid_cell_number_message
    "invalid cell number"
  end

  def winner(name)
    "name won"
  end

  def draw
    "draw"
  end
end
