require_relative 'board.rb'

class UI

  attr_reader :board, :input, :output

  def initialize(board, input=STDIN, output=STDOUT)
    @board = board
    @input = input
    @output = output
  end

  def get_input
    @input.gets.chomp
  end

  def get_move
    get_input.to_i
  end

  def print_message(message)
    @output.puts message
  end

  def display_board
    board.game_grid
  end

  def invalid_grid_size_message
    print_message("Invalid grid size. Try again")
  end

  def unavailable_cell_message
    print_message("Cell is unavailable. Try again")
  end

  def player_move_message(name, letter)
    print_message("#{name} (#{letter}) select a cell:")
  end

  def invalid_cell_number_message
    print_message("Invalid cell number. Try again")
  end

  def winner(name)
    print_message("#{name} won!")
  end

  def draw
    print_message("Cat's game!")
  end
end
