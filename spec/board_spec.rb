require 'rspec'
require_relative '../lib/board.rb'
require_relative '../lib/cell.rb'

describe "Board" do

  let(:board) { Board.new(3) }

  context "#initialize" do
    it "creates a 3x3 grid by default" do
      grid_size = 3
      board.grid.each do |column|
        expect(column.size).to eq(3)
      end

      expect(board.grid.length).to eq(3)
    end

    it "creates a 4x4 grid by default" do
      grid_size = 4
      board = Board.new(grid_size)
      board.grid.each do |column|
        expect(column.size).to eq(4)
      end

      expect(board.grid.length).to eq(4)
    end
  end

  context "#cells" do
    it "returns true if cell is available to write into" do
      board.write_cell(0, 0, 'X')

      expect(board.cell_available?(0, 1)).to be true
    end

    it "returns false if cell is unavailable" do
      board = Board.new(4)
      board.write_cell(1, 1, 'O')

      expect(board.cell_available?(1, 1)).to be false
    end

    it "returns true for a valid cell number for 3x3 grid (1-9)" do
      expect(board.valid_cell_number?(5)).to be true
    end

    it "returns true for a valid cell number for 4x4 grid (1-16)" do
      board = Board.new(4)

      expect(board.valid_cell_number?(14)).to be true
    end

    it "returns false for an invalid cell number for 3x3 grid !(1-9)" do
      expect(board.valid_cell_number?(10)).to be false
    end

    it "returns false for an invalid cell number for 4x4 grid !(1-16)" do
      board = Board.new(4)

      expect(board.valid_cell_number?(19)).to be false
    end

    it "gets the value from specified cell" do
      grid = [["hi", "", ""], ["", "", "test"], ["", "", ""]]
      board = Board.new(3, grid: grid)

      expect(board.get_cell(0, 0)).to eq('hi')
      expect(board.get_cell(1, 2)).to eq('test')
    end

    it "writes to the cell" do
      grid = [["", "", ""], [Cell.new("X"), "", ""], ["", Cell.new("O"), ""]]
      board = Board.new(3, grid: grid)
      board.write_cell(1, 0, "test")
      board.write_cell(2, 1, "another test")

      expect(board.get_cell(1, 0).value).to eq("test")
      expect(board.get_cell(2, 1).value).to eq("another test")
    end
  end

  context "#game_over" do
    it "returns false if game is not over yet" do
      grid = [Cell.new("X"), Cell.new("O"), ""]
      board = Board.new(3, grid: grid)
    end

    it "returns win if diagonal match" do
      cell = Cell.new
      grid = [[cell, cell, cell], [cell, cell, cell], [cell, cell, cell]]
      board = Board.new(3, grid: grid)

      board.write_cell(2, 0, 'X')
      board.write_cell(1, 1, 'X')
      board.write_cell(0, 2, 'X')

      expect(board.win?).to be true
    end

    it "returns win if horizontal match" do
      cell = Cell.new
      grid = [[cell, cell, cell], [cell, cell, cell], [cell, cell, cell]]
      board = Board.new(3, grid: grid)

      board.write_cell(0, 0, 'X')
      board.write_cell(0, 1, 'X')
      board.write_cell(0, 2, 'X')

      expect(board.win?).to be true
    end

    it "returns win if vertical match" do
      cell = Cell.new
      grid = [[cell, cell, cell, cell], [cell, cell, cell, cell], [cell, cell, cell, cell], [cell, cell, cell, cell]]
      board = Board.new(4, grid: grid)

      board.write_cell(0, 0, 'O')
      board.write_cell(1, 0, 'O')
      board.write_cell(2, 0, 'O')
      board.write_cell(3, 0, 'X')

      expect(board.win?).to be true
    end

    it "returns true for draw" do
      grid = [Cell.new("X"), Cell.new("O"), Cell.new("hi")]
      board = Board.new(3, grid: grid)

      expect(board.draw?).to be true
    end

    it "returns draw if no match" do
      cell = Cell.new
      grid = [[cell, cell, cell], [cell, cell, cell], [cell, cell, cell]]
      board = Board.new(3, grid: grid)

      board.write_cell(0, 0, 'O')
      board.write_cell(0, 1, 'O')
      board.write_cell(0, 2, 'X')
      board.write_cell(1, 0, 'O')
      board.write_cell(1, 1, 'X')
      board.write_cell(1, 2, 'O')
      board.write_cell(2, 0, 'O')
      board.write_cell(2, 1, 'X')
      board.write_cell(2, 2, 'X')

      expect(board.draw?).to be true
    end
  end
end

