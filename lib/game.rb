class Game
  attr_reader :board, :players, :selection, :ui, :current_player, :next_player

  def initialize(board, players, selection, ui)
    @board = board
    @players = players
    @selection = selection
    @ui = ui
    @current_player, @next_player = players
    @turns = 0
  end

  def play
    until board.win? or board.draw?
      @turns += 1
      player_move
    end
    game_over
  end

  def player_move
    case selection
    when 1
      human_vs_computer_move
    when 2
      human_vs_human_move
    end
  end

  def human_vs_computer_move
    if @turns.odd?
      board.game_grid
      get_human_move
    else
      next_player.move
      ui.print_message("#{next_player.name} (#{next_player.letter}) has played")
    end
  end

  def human_vs_human_move
    board.game_grid
    get_human_move
    if board.win? or board.draw?
      return
    else
      switch_players
    end
  end

  def get_human_move
    ui.player_move_message(current_player.name, current_player.letter)
    x, y = get_coordinates
    until board.cell_available?(x, y)
      ui.unavailable_cell_message
      x, y = get_coordinates
    end
    current_player.move(x, y, current_player.letter)
  end

  def get_coordinates(cell_number = ui.get_move)
    until board.valid_cell_number?(cell_number)
      ui.invalid_cell_number_message
      cell_number = ui.get_move
    end
    number_to_coordinates(cell_number)
  end

  def switch_players
    @current_player, @next_player = @next_player, @current_player
  end


  private

  def game_over
    board.game_grid
    case selection
    when 1
      if board.win? && @turns.even?
        ui.winner(next_player.name)
      elsif board.win?
        ui.winner(current_player.name)
      elsif board.draw?
        ui.draw
      end
    when 2
      if board.win?
        ui.winner(current_player.name)
      elsif board.draw?
        ui.draw
      end
    end
  end

  def number_to_coordinates(cell_number)
    temp_array = []
    coordinates_array = []
    for y in 0...board.grid_size
      for x in 0...board.grid_size
        temp_array = [x, y]
        coordinates_array << temp_array
      end
    end
    coordinates_array[cell_number-1]
  end
end
