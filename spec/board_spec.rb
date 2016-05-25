require 'rspec'
require_relative '../lib/board.rb'

describe "Board" do
  context "n x n" do
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
end
