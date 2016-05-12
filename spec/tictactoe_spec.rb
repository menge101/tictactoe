require 'rspec'
require_relative '../lib/tictactoe.rb'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

describe "Tictactoe" do

  let(:board) { Board.new }
  let(:foo) { Player.new({name: 'foo', letter: 'X'}) }
  let(:bar) { Player.new({name: 'bar', letter: 'O'}) }
  let(:ttt) { TicTacToe.new(board, [foo, bar]) }

  context "#switch_players" do
    it "switches current player to next player" do
      next_player = ttt.next_player
      ttt.switch_players

      expect(ttt.current_player).to eq(next_player)
    end

    it "switches next player to current player" do
      current_player = ttt.current_player
      ttt.switch_players

      expect(ttt.next_player).to eq(current_player)
    end
  end

  context "#messages" do
    it "returns 'foo won!' if foo wins" do
      allow(ttt).to receive(:current_player).and_return(foo)
      allow(ttt).to receive(:game_over).and_return(:winner)

      expect(ttt.game_over_message).to eq("foo won!")
    end

    it "returns 'Cat's game!' if the game ends in a draw" do
      allow(ttt).to receive(:current_player).and_return(bar)
      allow(ttt).to receive(:game_over).and_return(:draw)

      expect(ttt.game_over_message).to eq("Cat's game!")
    end
  end
end
