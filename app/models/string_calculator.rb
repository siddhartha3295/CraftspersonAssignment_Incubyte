class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
    end

    numbers = numbers.split(/#{delimiter}|\n/).map(&:to_i)
    negatives = numbers.select { |num| num < 0 }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers.sum
  end
end
