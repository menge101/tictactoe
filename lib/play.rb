require_relative 'computer.rb'
require_relative 'game.rb'
require_relative 'human_player.rb'
require_relative 'ttt_board.rb'
require_relative 'ui.rb'

ui = UI.new
selection = ui.get_selection
grid_size = ui.get_grid_size
ttt_board = TTTBoard.new(grid_size)
case selection
when 1      # human vs. computer
  human_player = HumanPlayer.new(ttt_board, ui, {name: "Player", letter: "X"})
  computer = Computer.new(ttt_board, ui, {name: "Computer", letter: "O"})
  players = [human_player, computer]
when 2      # human vs. human
  player1 = HumanPlayer.new(ttt_board, ui, {name: "Player 1", letter: "X"})
  player2 = HumanPlayer.new(ttt_board, ui, {name: "Player 2", letter: "O"})
  players = [player1, player2]
end
game = Game.new(ttt_board, players, ui)
game.play
