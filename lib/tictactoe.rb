class TicTacToe

  attr_reader :board, :players, :current_player, :next_player

  def initialize(board, players)
    @board = board
    @players = players
    @current_player, @next_player = players.shuffle
    @turn_count = 1
  end

  def game
    puts ""
    board.display_board
    while true
      puts ""
      puts "#{current_player.name}, select a cell:"
      cell_number = gets.chomp.to_i
      x, y = board.number_to_coordinates(cell_number)
      until board.cell_available?(x, y)
        puts "Cell unavailable! Try again"
        cell_number = gets.chomp.to_i
        x, y = board.number_to_coordinates(cell_number)
      end
      board.write_cell(x, y, current_player.letter)
      puts ""
      board.display_board
      if game_over
        puts game_over_message
        return
      else
        @turn_count += 1
        switch_players
      end
    end
  end

  def game_over
    if win?
      return :winner
    elsif draw?
      return :draw
    end
  end

  def game_over_message
    if game_over == :winner
      return "#{current_player.name} won!"
    elsif game_over == :draw
      return "Cat's game!"
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

  def switch_players
    @current_player, @next_player = @next_player, @current_player
  end
end
