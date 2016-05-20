class Game

  attr_reader :board, :players, :ui, :current_player, :next_player

  def initialize(board, players, ui)
    @board = board
    @players = players
    @ui = ui
    @current_player, @next_player = players.shuffle
  end

  def play
    until board.win? or board.draw?
      ui.display_board
      ui.player_move_message(current_player.name, current_player.letter)
      player_move
    end
    game_over
  end

  def player_move
    x, y = get_coordinates
    until board.cell_available?(x, y)
      ui.unavailable_cell_message
      x, y = get_coordinates
    end
    board.write_cell(x, y, current_player.letter)
    if board.win? or board.draw?
      return
    else
      switch_players
    end
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
    ui.display_board
    if board.win?
      ui.winner(current_player.name)
    elsif board.draw?
      ui.draw
    end
  end

  def number_to_coordinates(cell_number)
    temp_array = []
    coordinates_array = []
    for x in 0...board.grid_size
      for y in 0...board.grid_size
        temp_array = [x, y]
        coordinates_array << temp_array
      end
    end
    coordinates_array[cell_number-1]
  end
end
