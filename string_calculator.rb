class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = Regexp.escape(delimiter_line[2])
    else
      delimiter = ",|\n"
    end

    parts = numbers.split(/#{delimiter}/).map(&:to_i)

    negatives = parts.select { |num| num < 0 }
    if negatives.any?
      raise "negative numbers not allowed #{negatives.join(', ')}"
    end

    parts.sum
  end
end
