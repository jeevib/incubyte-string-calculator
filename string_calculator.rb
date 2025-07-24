class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    return numbers.to_i unless numbers.include?(",") || numbers.include?("\n")

    parts = numbers.split(/,|\n/).map(&:to_i)
    parts.sum
  end
end
