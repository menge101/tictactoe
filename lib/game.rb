class Game
  attr_reader :board, :players, :ui, :current_player, :next_player

  def initialize(board, players, ui)
    @board = board
    @players = players
    @ui = ui
    @current_player, @next_player = players
  end

  def play
    until board.win? or board.draw?
      board.game_grid
      player_move
    end
    game_over
  end

  def player_move
    current_player.move
    if board.win? or board.draw?
      return
    else
      switch_players
    end
  end

  def switch_players
    @current_player, @next_player = @next_player, @current_player
  end

  def game_over
    board.game_grid
    if board.win?
      ui.winner(current_player.name)
    elsif board.draw?
      ui.draw
    end
  end
end
