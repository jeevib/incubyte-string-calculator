class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)

      if delimiter_line.match(/\[(.+)\]/)
        delimiter = Regexp.escape(delimiter_line[/\[(.+)\]/, 1])
      else
        delimiter = Regexp.escape(delimiter_line[2])
      end
    end

    parts = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = parts.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(', ')}" if negatives.any?

    parts.reject { |n| n > 1000 }.sum
  end
end
