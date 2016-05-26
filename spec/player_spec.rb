require 'rspec'
require_relative '../lib/player.rb'
require_relative '../lib/ttt_board.rb'

describe "Player" do
  context "#name" do
    it "returns the correct name" do
      ttt_board = TTTBoard.new(3)
      input = {name: "brian", letter: "X"}
      player = Player.new(ttt_board, input)

      expect(player.name).to eq("brian")
    end
  end

  context "#letter" do
    it "returns the correct letter" do
      ttt_board = TTTBoard.new(3)
      input = {name: "hello", letter: "K"}
      player = Player.new(ttt_board, input)

      expect(player.letter).to eq("K")
    end
  end
end
