class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter, numbers = numbers[2], numbers.split("\n", 2).last
    else
      delimiter = ","
    end

    negative_check = numbers.gsub("\n", delimiter).split(delimiter).map(&:to_i)

    raise "negative numbers not allowed #{negative_check.select{|n| n < 0}.join(", ")}" if negative_check.min < 0

    negative_check.sum
  end
end