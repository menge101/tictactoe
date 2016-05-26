require 'rspec'
require_relative '../lib/human_player.rb'
require_relative '../lib/ttt_board.rb'

describe "Human player" do
  context "#player" do
    it "should be an instance of Player" do
      ttt_board = TTTBoard.new(4)
      human_player = HumanPlayer.new(ttt_board, {name: "hello", letter: "O"})

      expect(human_player).to be_a(Player)
    end
  end

  context "#write" do
    it "writes the value to the specified cell in the grid" do
      ttt_board = TTTBoard.new(3)
      human_player = HumanPlayer.new(ttt_board, {name: "hi", letter: "X"})

      human_player.move(0, 2, human_player.letter)
      human_player.move(1, 2, human_player.letter)
      human_player.move(2, 2, human_player.letter)

      expect(ttt_board.get_cell(0, 2)).to eq("X")
      expect(ttt_board.get_cell(1, 2)).to eq("X")
      expect(ttt_board.get_cell(2, 2)).to eq("X")
    end
  end
end
