require 'rspec'
require_relative '../lib/ui.rb'
require_relative '../lib/board.rb'

describe "UI" do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:ui) { UI.new(input, output) }

  context "#input" do
    it "gets the input" do
      input.string = "test"

      expect(ui.get_input).to eq("test")
    end

    it "returns an integer from the player's move" do
      input.string = "3"

      expect(ui.get_move).to be_an(Integer)
    end

    it "gets the correct grid size from player" do
      allow(ui).to receive(:get_move).and_return(3)

      expect(ui.get_grid_size).to eq(3)
    end

    it "gets the selection for vs. computer or vs. human" do
      (1..2).each do |selection|
        allow(ui).to receive(:get_move).and_return(selection)

        expect(ui.get_selection).to eq(selection)
      end
    end

    it "gets the players' names" do
      allow(ui).to receive(:get_input).and_return("best name")

      expect(ui.get_player_name).to eq("best name")
    end
  end

  context "#output" do
    it "displays the correct output" do
      ui.print_message("this is a test message")

      expect(output.string).to eq("this is a test message\n")
    end
  end

  context "#messages" do
    it "prompts the user to input a grid size" do
      correct_message = "Enter grid size:"

      expect(ui).to receive(:print_message).with(correct_message)

      ui.get_grid_size_message
    end

    it "prints the invalid grid size message" do
      correct_message = "Invalid grid size. Try again"

      expect(ui).to receive(:print_message).with(correct_message)

      ui.invalid_grid_size_message
    end

    it "displays the incorrect grid size message if grid size is invalid" do
      allow(ui).to receive(:get_move).and_return(1, 3)

      expect(ui).to receive(:invalid_grid_size_message)

      ui.get_grid_size
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

  context "#get_selection" do
    it "prints selection message when get_selection is called" do
      correct_message = "Enter 1 for human vs. computer or 2 for human vs. human"
      allow(ui).to receive(:get_move).and_return(2)

      expect(ui).to receive(:print_message).with(correct_message)

      ui.get_selection
    end

    it "prints the invalid selection message for invalid selection" do
      correct_message = "Invalid selection. Try again"
      allow(ui).to receive(:print_message).with("Enter 1 for human vs. computer or 2 for human vs. human")
      allow(ui).to receive(:get_move).and_return(0, 1)

      expect(ui).to receive(:print_message).with(correct_message)

      ui.get_selection
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
