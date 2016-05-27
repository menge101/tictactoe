require 'rspec'
require_relative '../lib/board.rb'

describe "Board" do
  context "#nxn" do
    it "creates n rows if grid size is n" do
      (3..100).each do |num|
        board = Board.new(num)

        expect(board.generate_board.size).to eq(num)
      end
    end

    it "creates n cells in each row" do
      (3..100).each do |num|
        board = Board.new(num)

        board.generate_board.each do |row|
          expect(row.size).to eq(num)
        end
      end
    end
  end

  context "#3x3" do
    it "generates 3x3 grid with correct cell numbers" do
      correct_grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      board = Board.new(3)

      expect(board.generate_board).to eq(correct_grid)
    end
  end
end
