require_relative 'board.rb'

class UI

  attr_reader :board, :input, :output

  def initialize(board, input=STDIN, output=STDOUT)
    @board = board
    @input = input
    @output = output
  end

  def get_input
    @input.gets
  end

  def get_move
    get_input.to_i
  end

  def print_message(message)
    @output.puts message
  end

  def display_board
    print_message(" #{board.grid[0][0]} | #{board.grid[0][1]} | #{board.grid[0][2]} ")
    print_message("-----------")
    print_message(" #{board.grid[1][0]} | #{board.grid[1][1]} | #{board.grid[1][2]} ")
    print_message("-----------")
    print_message(" #{board.grid[2][0]} | #{board.grid[2][1]} | #{board.grid[2][2]} ")
  end

  def unavailable_cell_message
    print_message("Cell unavailable. Try again")
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

  #def print_outcome(name, game_over)
  #  if game_over == :winner
  #    winner(name)
  #  elsif game_over == :draw
  #    draw
  #  end
  #end
end
