require 'rspec'
require_relative '../lib/player.rb'

describe "Player" do
  context "#name" do
    it "returns the correct name" do
      input = {name: 'brian', letter: 'X'}
      player = Player.new(input)

      expect(player.name).to eq('brian')
    end
  end

  context "#letter" do
    it "returns the correct letter" do
      input = {name: 'hello', letter: 'K'}
      player = Player.new(input)

      expect(player.letter).to eq('K')
    end
  end
end
