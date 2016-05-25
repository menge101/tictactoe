require 'rspec'
require_relative '../lib/board.rb'
require_relative '../lib/ttt_board.rb'

describe "TTTBoard" do

  let(:ttt_board) { TTTBoard.new(3) }

  context "#initialize" do
    it "creates a 3x3 grid by default" do
      grid_size = 3
      ttt_board.grid.each do |column|
        expect(column.size).to eq(3)
      end

      expect(ttt_board.grid.length).to eq(3)
    end

    it "creates a 4x4 grid by default" do
      grid_size = 4
      ttt_board = TTTBoard.new(grid_size)
      ttt_board.grid.each do |column|
        expect(column.size).to eq(4)
      end

      expect(ttt_board.grid.length).to eq(4)
    end
  end

  context "#cells" do
    it "returns true if cell is available to write into" do
      ttt_board.write_cell(0, 0, 'X')

      expect(ttt_board.cell_available?(0, 1)).to be true
    end

    it "returns false if cell is unavailable" do
      ttt_board.write_cell(1, 1, 'O')

      expect(ttt_board.cell_available?(1, 1)).to be false
    end

    it "returns true for a valid cell number for 3x3 grid (1-9)" do
      expect(ttt_board.valid_cell_number?(5)).to be true
    end

    it "returns true for a valid cell number for 4x4 grid (1-16)" do
      ttt_board = TTTBoard.new(4)

      expect(ttt_board.valid_cell_number?(14)).to be true
    end

    it "returns false for an invalid cell number for 3x3 grid !(1-9)" do
      expect(ttt_board.valid_cell_number?(10)).to be false
    end

    it "returns false for an invalid cell number for 4x4 grid !(1-16)" do
      board = Board.new(4)

      expect(ttt_board.valid_cell_number?(19)).to be false
    end

    it "gets the value from specified cell" do
      grid = [["hi", "", ""], ["", "", "test"], ["", "", ""]]
      ttt_board = TTTBoard.new(3, grid: grid)

      expect(ttt_board.get_cell(0, 0)).to eq('hi')
      expect(ttt_board.get_cell(2, 1)).to eq('test')
    end

    it "writes to the cell" do
      board = Board.new(3)
      ttt_board = TTTBoard.new(3, grid: board.generate_board)
      ttt_board.write_cell(1, 0, "test")
      ttt_board.write_cell(2, 1, "another test")

      expect(ttt_board.get_cell(1, 0).value).to eq("test")
      expect(ttt_board.get_cell(2, 1).value).to eq("another test")
    end
  end

  context "#game_over" do
    it "returns win if diagonal match" do
      board = Board.new(3)
      ttt_board = TTTBoard.new(3, grid: board.generate_board)

      ttt_board.write_cell(2, 0, 'X')
      ttt_board.write_cell(1, 1, 'X')
      ttt_board.write_cell(0, 2, 'X')

      expect(ttt_board.win?).to be true
    end

    it "returns win if horizontal match" do
      board = Board.new(3)
      ttt_board = TTTBoard.new(3, grid: board.generate_board)

      ttt_board.write_cell(0, 1, 'X')
      ttt_board.write_cell(1, 1, 'X')
      ttt_board.write_cell(2, 1, 'X')

      expect(ttt_board.win?).to be true
    end

    it "returns win if vertical match" do
      board = Board.new(4)
      ttt_board = TTTBoard.new(4, grid: board.generate_board)

      ttt_board.write_cell(0, 0, 'O')
      ttt_board.write_cell(0, 1, 'O')
      ttt_board.write_cell(0, 2, 'O')
      ttt_board.write_cell(0, 3, 'O')

      expect(ttt_board.win?).to be true
    end

    it "returns draw if no match" do
      board = Board.new(3)
      ttt_board = TTTBoard.new(3, grid: board.generate_board)

      ttt_board.write_cell(0, 0, 'X')
      ttt_board.write_cell(1, 0, 'O')
      ttt_board.write_cell(2, 0, 'O')
      ttt_board.write_cell(0, 1, 'O')
      ttt_board.write_cell(1, 1, 'O')
      ttt_board.write_cell(2, 1, 'X')
      ttt_board.write_cell(0, 2, 'X')
      ttt_board.write_cell(1, 2, 'X')
      ttt_board.write_cell(2, 2, 'O')

      expect(ttt_board.draw?).to be true
    end
  end
end

