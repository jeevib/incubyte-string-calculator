class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter_pattern = /,|\n/

    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)

      if delimiter_line.include?("[") && delimiter_line.include?("]")
        delimiters = delimiter_line.scan(/\[(.*?)\]/).flatten
        delimiter_pattern = Regexp.union(*delimiters)
      else
        delimiter = delimiter_line[2]
        delimiter_pattern = Regexp.new(Regexp.escape(delimiter))
      end
    end

    parts = numbers.split(delimiter_pattern)
    numbers_array = parts.map(&:to_i)

    negatives = numbers_array.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(', ')}" if negatives.any?

    numbers_array.reject { |n| n > 1000 }.sum
  end
end