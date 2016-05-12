require_relative 'tictactoe.rb'
require_relative 'player.rb'
require_relative 'board.rb'

foo = Player.new({name: 'Foo', letter: 'X'})
bar = Player.new({name: 'Bar', letter: 'O'})
board = Board.new
players = [foo, bar]
game = TicTacToe.new(board, players)
game.game
