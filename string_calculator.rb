class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiters_and_numbers(numbers)

    number_arr = numbers.gsub("\n", delimiter.first).split(Regexp.union(delimiter)).map(&:to_i)

    negative_check!(number_arr)

    number_arr.reject {|n| n > 1000}.sum
  end

  def extract_delimiters_and_numbers(numbers)
    if numbers.start_with?("//")
      delimiter = numbers.split("\n").first.tr('[]', '').tr("//", "").split('')
      numbers = numbers.split("\n", 2).last
    else
      delimiter = [","]
    end

    return delimiter, numbers
  end

  def negative_check!(number_arr)
    raise "negative numbers not allowed #{number_arr.select{|n| n < 0}.join(", ")}" if number_arr.min < 0
  end
end