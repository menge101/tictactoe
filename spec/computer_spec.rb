require 'rspec'
require_relative '../lib/computer.rb'
require_relative '../lib/ttt_board.rb'

describe "Computer" do
  context "#computer" do
    it "should be an instance of Player" do
      ttt_board = TTTBoard.new(3)
      computer = Computer.new(ttt_board, {name: "computer", letter: "O"})

      expect(computer).to be_a Player
    end
  end

  #context "#write" do
  #  it "writes to a blank cell" do
  #    ttt_board = TTTBoard.new(3)
  #    computer = Computer.new(ttt_board, {name: 'computer', letter: 'O'})

  #    computer.move

  #    expect(ttt_board.get_cell(0, 0).value).to eq('O')
  #  end
  #end
end
