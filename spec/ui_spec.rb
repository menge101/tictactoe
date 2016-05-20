require 'rspec'
require_relative '../lib/ui.rb'
require_relative '../lib/board.rb'

describe "UI" do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:board) { Board.new(3) }
  let(:ui) { UI.new(board, input, output) }

  context "#input" do
    it "gets the input" do
      input.string = "test"

      expect(ui.get_input).to eq("test")
    end

    it "returns an integer from the player's move" do
      input.string = "3"

      expect(ui.get_move).to be_an(Integer)
    end
  end

  context "#output" do
    it "displays the correct output" do
      ui.print_message("this is a test message")

      expect(output.string).to eq("this is a test message\n")
    end
  end

  context "#board" do
    it "displays the game board" do
      expect(board).to receive(:game_grid).and_return("game_board")

      ui.display_board
    end
  end

  context "#messages" do
    it "prints the invalid grid size message" do
      correct_message = "Invalid grid size. Try again"

      expect(ui).to receive(:print_message).with(correct_message)

      ui.invalid_grid_size_message
    end

    it "prints the unavailable cell message" do
      expect(ui).to receive(:print_message).with("Cell is unavailable. Try again")

      ui.unavailable_cell_message
    end

    it "prints the player move message" do
      expect(ui).to receive(:print_message).with("Player (X) select a cell:")

      name = "Player"
      letter = "X"
      ui.player_move_message(name, letter)
    end

    it "prints the invalid cell number message" do
      expect(ui).to receive(:print_message).with("Invalid cell number. Try again")

      ui.invalid_cell_number_message
    end
  end

  context "#outcome" do
    it "prints the winner" do
      expect(ui).to receive(:print_message).with("Player won!")

      ui.winner("Player")
    end

    it "prints cat's game" do
      expect(ui).to receive(:print_message).with("Cat's game!")

      ui.draw
    end
  end
end
