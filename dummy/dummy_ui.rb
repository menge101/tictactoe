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

  def get_selection
    1
  end

  def get_player_name
    return "player1", "player2"
  end

  def get_grid_size
    3
  end

  def player_move_message(name, letter)
    "name and letter"
  end

  def winner(name)
    "name won"
  end

  def draw
    "draw"
  end
end
