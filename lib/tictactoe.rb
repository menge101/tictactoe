class TicTacToe

  attr_reader :board, :players, :message, :current_player, :next_player

  def initialize(board, players, message)
    @board = board
    @players = players
    @message = message
    @current_player, @next_player = players.shuffle
    @turn_count = 1
  end

  def game
    while true
      board.display_board
      puts message.player_move(current_player.name, current_player.letter)
      x, y = get_move
      until board.cell_available?(x, y)
        puts message.unavailable_cell
        x, y = get_move
      end
      board.write_cell(x, y, current_player.letter)
      if game_over
        board.display_board
        puts message.game_over(game_over, current_player.name)
        return
      else
        @turn_count += 1
        switch_players
      end
    end
  end

  def get_move(cell_number = gets.chomp.to_i)
    until valid_cell_number(cell_number)
      puts message.invalid_cell_number
      cell_number = gets.chomp.to_i
    end
    number_to_coordinates(cell_number)
  end

  def switch_players
    @current_player, @next_player = @next_player, @current_player
  end


  private

  def game_over
    if win?
      return :winner
    elsif draw?
      return :draw
    end
  end

  def win?
    if board.horizontals
      true
    elsif board.verticals
      true
    elsif board.diagonals
      true
    else
      false
    end
  end

  def draw?
    if @turn_count == 9
      true
    else
      false
    end
  end

  def valid_cell_number(cell_number)
    cell_number >= 1 && cell_number <= 9
  end

  def number_to_coordinates(cell_number)
    mapping = {
      1 => [0, 0],
      2 => [0, 1],
      3 => [0, 2],
      4 => [1, 0],
      5 => [1, 1],
      6 => [1, 2],
      7 => [2, 0],
      8 => [2, 1],
      9 => [2, 2]
    }
    mapping[cell_number]
  end
end
