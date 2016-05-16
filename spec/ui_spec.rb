require 'rspec'
require_relative '../lib/ui.rb'
require_relative '../lib/board.rb'

describe "UI" do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:board) { Board.new }
  let(:ui) { UI.new(board, input, output) }

  context "#gets" do
    it "gets the input" do
      input.string = "test"

      expect(ui.get_input).to eq("test")
    end

    it "gets player move" do
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
    it "displays the board" do
      expect(ui).to receive(:print_message).with(" 1 | 2 | 3 ")
      expect(ui).to receive(:print_message).with("-----------")
      expect(ui).to receive(:print_message).with(" 4 | 5 | 6 ")
      expect(ui).to receive(:print_message).with("-----------")
      expect(ui).to receive(:print_message).with(" 7 | 8 | 9 ")

      ui.display_board
    end
  end

  context "#messages" do
    it "prints the unavailable cell message" do
      expect(ui).to receive(:print_message).with("Cell unavailable. Try again")

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
