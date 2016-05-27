require 'rspec'
require_relative '../lib/computer.rb'
require_relative '../lib/ttt_board.rb'
require_relative '../lib/ui.rb'

describe "Computer" do
  let(:ttt_board) { TTTBoard.new(3) }
  let(:ui) { UI.new(ttt_board) }
  let(:computer) { Computer.new(ttt_board, ui, {name: "computer", letter: "O"}) }

  context "#computer" do
    it "should be an instance of Player" do
      expect(computer).to be_a Player
    end
  end

  context "#write" do
    it "can write to a cell" do
      allow(ttt_board).to receive(:number_to_coordinates)
      allow(ttt_board).to receive(:get_cell)

      expect(ttt_board).to receive(:write_cell)

      computer.move
    end
  end
end
