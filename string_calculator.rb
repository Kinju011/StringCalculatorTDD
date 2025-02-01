class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter = numbers.split("\n").first.tr('[]', '').tr("//", "").split('')
      numbers = numbers.split("\n", 2).last
    else
      delimiter = [","]
    end

    negative_check = numbers.gsub("\n", delimiter.first).split(Regexp.union(delimiter)).map(&:to_i)

    raise "negative numbers not allowed #{negative_check.select{|n| n < 0}.join(", ")}" if negative_check.min < 0

    negative_check.reject {|n| n > 1000}.sum
  end
end