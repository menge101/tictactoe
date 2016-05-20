class DummyUI

  attr_reader :board, :input, :output

  def initialize(board, input=STDIN, output=STDOUT)
    @board = board
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

  def display_board
    "board"
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
