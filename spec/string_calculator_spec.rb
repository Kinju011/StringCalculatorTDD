require_relative '../string_calculator'


describe StringCalculator do
  let(:string_calaulator) { StringCalculator.new }
  
  it "returns 0 for an empty string" do
    expect(string_calaulator.add("")).to eq(0)
  end

  it "returns the number itself when a single number is passed" do
    expect(string_calaulator.add("5")).to eq(5)
  end

  it "returns the sum of two numbers separated by a comma" do
    expect(string_calaulator.add("1,2")).to eq(3)
  end

  it "returns the sum of two numbers separated by a comma or newline" do
    expect(string_calaulator.add("1\n2,3")).to eq(6)
  end

  it "should support different delimiters" do
    expect(string_calaulator.add("//;\n1;2")).to eq(3)
  end

  it "should raise an error for negative numbers" do
    expect{ string_calaulator.add("//;\n1;2;-3") }.to raise_exception(StandardError, "negative numbers not allowed -3")
  end

  it "should raise an error for negative numbers with multiple negative numbers" do
    expect{ string_calaulator.add("//;\n1;2;-3;6;-4") }.to raise_exception(StandardError, "negative numbers not allowed -3, -4")
  end

  it "should ignore the number bigger than 1000" do
    expect(string_calaulator.add("1,4,2,1001")).to eq(7)
  end

  it "should support delimiters of any length" do
    expect(string_calaulator.add("//[***]\n1***2***3")).to eq(6)
  end

  it "should support multiple delimiters" do
    expect(string_calaulator.add("//[*][%]\n1*2%3")).to eq(6)
  end

  it "should support multiple delimiters" do
    expect(string_calaulator.add("//[***][%%%%]\n\n\n1***2%%%3")).to eq(6)
  end
end