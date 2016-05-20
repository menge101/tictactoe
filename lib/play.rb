require_relative 'board.rb'
require_relative 'cell.rb'
require_relative 'game.rb'
require_relative 'player.rb'
require_relative 'ui.rb'

cell = Cell.new
ui = UI.new(nil)

ui.print_message("Enter grid size:")
grid_size = ui.get_input.to_i
until grid_size > 2
  ui.invalid_grid_size_message
  grid_size = ui.get_input.to_i
end

board = Board.new(grid_size)
ui = UI.new(board)

ui.print_message("Enter player 1 name:")
player1_name = ui.get_input
ui.print_message("Enter player 2 name:")
player2_name = ui.get_input
player1 = Player.new({name: player1_name, letter: 'X'})
player2 = Player.new({name: player2_name, letter: 'O'})
players = [player1, player2]

game = Game.new(board, players, ui)
game.play
