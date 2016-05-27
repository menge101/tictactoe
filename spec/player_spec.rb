require 'rspec'
require_relative '../lib/player.rb'
require_relative '../lib/ttt_board.rb'
require_relative '../lib/ui.rb'

describe "Player" do
  let(:ttt_board) { TTTBoard.new(3) }
  let(:ui) { UI.new(ttt_board) }

  context "#name" do
    it "returns the correct name" do
      input = {name: "brian", letter: "X"}
      player = Player.new(ttt_board, ui, input)

      expect(player.name).to eq("brian")
    end
  end

  context "#letter" do
    it "returns the correct letter" do
      input = {name: "hello", letter: "K"}
      player = Player.new(ttt_board, ui, input)

      expect(player.letter).to eq("K")
    end
  end
end
