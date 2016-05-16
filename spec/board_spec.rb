require 'rspec'
require_relative '../lib/board.rb'

describe "Board" do

  let(:board) { Board.new }

  context "#initialize" do
    it "creates an empty board by default" do
      grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

      expect(board.grid).to eq(grid)
    end
  end

  context "#cells" do
    it "returns true if cell is available to write into" do
      board.write_cell(0, 0, 'X')

      expect(board.cell_available?(0, 1)).to be true
    end

    it "returns false if cell is unavailable" do
      board.write_cell(1, 1, 'O')

      expect(board.cell_available?(1, 1)).to be false
    end

    it "returns true for a valid cell number (1-9)" do
      expect(board.valid_cell_number(3)).to be true
    end

    it "returns false for an invalid cell number !(1-9)" do
      expect(board.valid_cell_number(10)).to be false
    end

    it "writes a value into specified cell" do
      grid = [[1, 'X', 3], ['hello', 5, 6], [7, 8, 'O']]
      board.write_cell(0, 1, 'X')
      board.write_cell(1, 0, 'hello')
      board.write_cell(2, 2, 'O')

      expect(board.grid).to eq(grid)
    end

    it "gets the value from specified cell" do
      board.write_cell(1, 2, 'test')

      expect(board.get_cell(1, 2)).to eq('test')
    end
  end

  context "#horizontals" do
    it "returns true for matching top row" do
      board.write_cell(0, 0, 'X')
      board.write_cell(0, 1, 'X')
      board.write_cell(0, 2, 'X')

      expect(board.horizontals).to eq true
    end

    it "returns true for matching middle row" do
      board.write_cell(1, 0, 'O')
      board.write_cell(1, 1, 'O')
      board.write_cell(1, 2, 'O')

      expect(board.horizontals).to eq true
    end

    it "returns true for matching bottom row" do
      board.write_cell(2, 0, 'hi')
      board.write_cell(2, 1, 'hi')
      board.write_cell(2, 2, 'hi')

      expect(board.horizontals).to eq true
    end
  end

  context "#verticals" do
    it "returns true for matching left column" do
      board.write_cell(0, 0, 'hi')
      board.write_cell(1, 0, 'hi')
      board.write_cell(2, 0, 'hi')

      expect(board.verticals).to eq true
    end

    it "returns true for matching middle column" do
      board.write_cell(0, 1, 'X')
      board.write_cell(1, 1, 'X')
      board.write_cell(2, 1, 'X')

      expect(board.verticals).to eq true
    end

    it "returns true for matching right column" do
      board.write_cell(0, 2, 'O')
      board.write_cell(1, 2, 'O')
      board.write_cell(2, 2, 'O')

      expect(board.verticals).to eq true
    end
  end

  context "#diagonals" do
    it "returns true for matching top left, bottom right diagonal" do
      board.write_cell(0, 0, 'O')
      board.write_cell(1, 1, 'O')
      board.write_cell(2, 2, 'O')

      expect(board.diagonals).to eq true
    end

    it "returns true for matching top right, bottom left diagonal" do
      board.write_cell(0, 2, 'X')
      board.write_cell(1, 1, 'X')
      board.write_cell(2, 0, 'X')

      expect(board.diagonals).to eq true
    end
  end

  context "#coordinates" do
    it "returns the corresponding coordinates for given cell number" do
      expect(board.number_to_coordinates(1)).to eq([0, 0])
      expect(board.number_to_coordinates(5)).to eq([1, 1])
      expect(board.number_to_coordinates(9)).to eq([2, 2])
    end
  end
end
