class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers.split("\n", 2).last
    else
      delimiter = ","
    end
      
    negative_check = numbers.gsub("\n", delimiter).split(delimiter).map(&:to_i)

    raise "negative numbers not supported" if negative_check.min < 0

    negative_check.sum
  end
end