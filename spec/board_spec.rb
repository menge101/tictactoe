require 'rspec'
require_relative '../lib/board.rb'

describe "Board" do

  let(:board) { Board.new }

  context "#initialize" do
    it "creates an empty board by default" do
      grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

      expect(board.board).to eq(grid)
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

    it "writes a value into specified cell" do
      grid = [[1, 'X', 3], ['hello', 5, 6], [7, 8, 'O']]
      board.write_cell(0, 1, 'X')
      board.write_cell(1, 0, 'hello')
      board.write_cell(2, 2, 'O')

      expect(board.board).to eq(grid)
    end

    it "gets the value from specified cell" do
      board.write_cell(1, 2, 'test')

      expect(board.get_cell(1, 2)).to eq('test')
    end

    it "converts the cell number into correct coordinates" do
      expect(board.number_to_coordinates(1)).to eq([0, 0])
      expect(board.number_to_coordinates(2)).to eq([0, 1])
      expect(board.number_to_coordinates(3)).to eq([0, 2])
      expect(board.number_to_coordinates(4)).to eq([1, 0])
      expect(board.number_to_coordinates(5)).to eq([1, 1])
      expect(board.number_to_coordinates(6)).to eq([1, 2])
      expect(board.number_to_coordinates(7)).to eq([2, 0])
      expect(board.number_to_coordinates(8)).to eq([2, 1])
      expect(board.number_to_coordinates(9)).to eq([2, 2])
    end
  end

  context "#horizontals" do
    it "returns true for matching top row" do
      x, y = board.number_to_coordinates(1)
      board.write_cell(x, y, 'X')
      x, y = board.number_to_coordinates(2)
      board.write_cell(x, y, 'X')
      x, y = board.number_to_coordinates(3)
      board.write_cell(x, y, 'X')

      expect(board.horizontals).to eq true
    end

    it "returns true for matching middle row" do
      x, y = board.number_to_coordinates(4)
      board.write_cell(x, y, 'O')
      x, y = board.number_to_coordinates(5)
      board.write_cell(x, y, 'O')
      x, y = board.number_to_coordinates(6)
      board.write_cell(x, y, 'O')

      expect(board.horizontals).to eq true
    end

    it "returns true for matching bottom row" do
      x, y = board.number_to_coordinates(7)
      board.write_cell(x, y, 'hi')
      x, y = board.number_to_coordinates(8)
      board.write_cell(x, y, 'hi')
      x, y = board.number_to_coordinates(9)
      board.write_cell(x, y, 'hi')

      expect(board.horizontals).to eq true
    end
  end

  context "#verticals" do
    it "returns true for matching left column" do
      x, y = board.number_to_coordinates(1)
      board.write_cell(x, y, 'hi')
      x, y = board.number_to_coordinates(4)
      board.write_cell(x, y, 'hi')
      x, y = board.number_to_coordinates(7)
      board.write_cell(x, y, 'hi')

      expect(board.verticals).to eq true
    end

    it "returns true for matching middle column" do
      x, y = board.number_to_coordinates(2)
      board.write_cell(x, y, 'X')
      x, y = board.number_to_coordinates(5)
      board.write_cell(x, y, 'X')
      x, y = board.number_to_coordinates(8)
      board.write_cell(x, y, 'X')

      expect(board.verticals).to eq true
    end

    it "returns true for matching right column" do
      x, y = board.number_to_coordinates(3)
      board.write_cell(x, y, 'O')
      x, y = board.number_to_coordinates(6)
      board.write_cell(x, y, 'O')
      x, y = board.number_to_coordinates(9)
      board.write_cell(x, y, 'O')

      expect(board.verticals).to eq true
    end
  end

  context "#diagonals" do
    it "returns true for matching top left, bottom right diagonal" do
      x, y = board.number_to_coordinates(1)
      board.write_cell(x, y, 'O')
      x, y = board.number_to_coordinates(5)
      board.write_cell(x, y, 'O')
      x, y = board.number_to_coordinates(9)
      board.write_cell(x, y, 'O')

      expect(board.diagonals).to eq true
    end

    it "returns true for matching top right, bottom left diagonal" do
      x, y = board.number_to_coordinates(3)
      board.write_cell(x, y, 'X')
      x, y = board.number_to_coordinates(5)
      board.write_cell(x, y, 'X')
      x, y = board.number_to_coordinates(7)
      board.write_cell(x, y, 'X')

      expect(board.diagonals).to eq true
    end
  end
end
