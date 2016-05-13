require 'rspec'
require_relative '../lib/tictactoe.rb'
require_relative '../lib/board.rb'
require_relative '../dummy/dummy_player.rb'
require_relative '../dummy/dummy_message.rb'

describe "Tictactoe" do

  let(:board) { Board.new }
  let(:foo) { DummyPlayer.new({name: 'foo', letter: 'X'}) }
  let(:bar) { DummyPlayer.new({name: 'bar', letter: 'O'}) }
  let(:message) { DummyMessage.new }
  let(:ttt) { TicTacToe.new(board, [foo, bar], message) }

  context "#initialize" do
    it "randomly selects a player as the current player" do
      allow_any_instance_of(Array).to receive(:shuffle).and_return([foo, bar])

      expect(ttt.current_player).to eq(foo)
    end

    it "selects the remaining player as the next player" do
      allow_any_instance_of(Array).to receive(:shuffle).and_return([foo, bar])

      expect(ttt.next_player).to eq(bar)
    end
  end

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

  context "#player_move" do
    it "converts the player number into coordinates" do
      correct_coordinates = [1, 0]

      expect(ttt.get_move(4)).to eq(correct_coordinates)
    end
  end
end
