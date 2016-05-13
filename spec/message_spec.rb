require 'rspec'
require_relative '../lib/message.rb'

describe "Message" do

  let(:message) { Message.new }

  context "#player_move" do
    it "prints the correct name and letter" do
      correct_message = "Player (X), select a space:"

      expect(message.player_move("Player", "X")).to eq(correct_message)
    end
  end

  context "#unavailable_cell" do
    it "prints the unavailable cell message" do
      correct_message = "Cell is unavailable. Try again"

      expect(message.unavailable_cell).to eq(correct_message)
    end
  end

  context "#game_over" do
    it "prints the winner message" do
      correct_message = "Player won!"

      expect(message.game_over(:winner, "Player")).to eq(correct_message)
    end

    it "prints cat's game message" do
      correct_message = "Cat's game!"

      expect(message.game_over(:draw, "Fake")).to eq(correct_message)
    end
  end
end
