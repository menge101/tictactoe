require_relative 'tictactoe.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'message.rb'

puts "Enter player 1 name:"
player1_name = gets.chomp
puts "Enter player 2 name:"
player2_name = gets.chomp
player1 = Player.new({name: player1_name, letter: 'X'})
player2 = Player.new({name: player2_name, letter: 'O'})
players = [player1, player2]

board = Board.new

message = Message.new

game = TicTacToe.new(board, players, message)
game.game
