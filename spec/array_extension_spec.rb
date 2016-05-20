require 'rspec'
require_relative '../lib/array_extension.rb'

describe "Array" do

  it "returns true for an array that is completely empty" do
    expect(["", ""].all_empty?).to be true
  end

  it "returns false for an array that is not completely empty" do
    expect(["", "hi"].all_empty?).to be false
  end

  it "returns true for an array that has an empty element" do
    expect(["", "hi"].any_empty?).to be true
  end

  it "returns false for an array that has no empty elements" do
    expect(["hey", "hi"].any_empty?).to be false
  end

  it "returns true for an array has no empty elements" do
    expect(["hey", "hi"].none_empty?).to be true
  end

  it "returns false for an array that is not completely empty" do
    expect(["", ""].none_empty?).to be false
  end

  it "returns true for an array that has the same elements" do
    expect(["hi", "hi"].all_same?).to be true
  end

  it "returns false for an array that has different elements" do
    expect(["", "hi"].all_same?).to be false
  end
end
