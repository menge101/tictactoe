require 'rspec'
require_relative '../lib/cell.rb'

describe "Cell" do

  context "#initialize" do
    it "is initialized with '' by default" do
      cell = Cell.new

      expect(cell.value).to eq('')
    end

    it "can be initialized with any string" do
      cell = Cell.new("hello")

      expect(cell.value).to eq("hello")
    end
  end
end
