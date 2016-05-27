class UI
  attr_reader :input, :output

  def initialize(input=STDIN, output=STDOUT)
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

  def get_selection
    print_message("Enter 1 for human vs. computer or 2 for human vs. human")
    selection = get_move
    until selection > 0 && selection < 3
      print_message("Invalid selection. Try again")
      selection = get_move
    end
    selection
  end

  def get_player_name
    print_message("Enter player name:")
    player_name = get_input
  end

  def get_grid_size
    print_message("Enter grid size:")
    grid_size = get_move
    until grid_size > 2
      print_message("Invalid grid size. Try again")
      grid_size = get_move
    end
    grid_size
  end

  def player_move_message(name, letter)
    print_message("#{name} (#{letter}) select a cell:")
  end

  def winner(name)
    print_message("#{name} won!")
  end

  def draw
    print_message("Cat's game!")
  end
end
