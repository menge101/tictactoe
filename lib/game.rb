class Game

  attr_reader :board, :players, :ui, :current_player, :next_player

  def initialize(board, players, ui)
    @board = board
    @players = players
    @ui = ui
    @current_player, @next_player = players.shuffle
    @turn_count = 0
  end

  def play
    until win? or draw?
      ui.display_board
      ui.player_move_message(current_player.name, current_player.letter)
      player_move
    end
    game_over
  end

  def switch_players
    @current_player, @next_player = @next_player, @current_player
  end

  def game_over
    ui.display_board
    if win?
      ui.winner(next_player.name)
    #elsif draw?
    else
      ui.draw
    end
  end


  private

  def player_move
    x, y = get_coordinates
    until board.cell_available?(x, y)
      ui.unavailable_cell_message
      x, y = get_coordinates
    end
    board.write_cell(x, y, current_player.letter)
    if !win? or !draw?
      switch_players
      @turn_count += 1
    end
  end

  def get_coordinates(cell_number = ui.get_move)
    until board.valid_cell_number(cell_number)
      ui.invalid_cell_number_message
      cell_number = ui.get_move
    end
    board.number_to_coordinates(cell_number)
  end

  def win?
    board.horizontals || board.verticals || board.diagonals
  end

  def draw?
    @turn_count == 9
  end
end
