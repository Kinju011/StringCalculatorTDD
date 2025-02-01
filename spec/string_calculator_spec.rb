require_relative '../string_calculator'

describe StringCalculator do
  it "returns 0 for an empty string" do
    expect(StringCalculator.new.add("")).to eq(0)
  end

  it "returns the number itself when a single number is passed" do
    expect(StringCalculator.new.add("5")).to eq(5)
  end

  it "returns the sum of two numbers separated by a comma" do
    expect(StringCalculator.new.add("1,2")).to eq(3)
  end
end