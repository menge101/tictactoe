require 'rspec'
require_relative '../lib/human_player.rb'
require_relative '../lib/ttt_board.rb'
require_relative '../lib/ui.rb'

describe "Human player" do
  context "#player" do
    it "should be an instance of Player" do
      ttt_board = TTTBoard.new(4)
      ui = UI.new
      human_player = HumanPlayer.new(ttt_board, ui, {name: "hello", letter: "O"})

      expect(human_player).to be_a(Player)
    end
  end

  context "#write" do
    it "writes a value" do
      ttt_board = TTTBoard.new(3)
      ui = UI.new
      human_player = HumanPlayer.new(ttt_board, ui, {name: "hi", letter: "X"})

      allow(ui).to receive(:player_move_message)
      allow(human_player).to receive(:human_coordinates).and_return([1, 2])

      expect(ttt_board).to receive(:write_cell).with(1, 2, "X")

      human_player.move
    end
  end
end
