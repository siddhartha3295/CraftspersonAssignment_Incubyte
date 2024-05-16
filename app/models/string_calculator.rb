class StringCalculator
  # Constants for default values to avoid magic strings in the code.
  DEFAULT_DELIMITER = ","
  CUSTOM_DELIMITER_PREFIX = "//"

  # Public method to add numbers provided in a string.
  def add(numbers)
    # Return 0 if the input string is empty.
    return 0 if numbers.empty?

    # Extract the delimiter and the actual numbers part from the input string.
    delimiter, numbers = extract_delimiter_and_numbers(numbers)
    # Parse the numbers string into an array of integers using the extracted delimiter.
    num_list = parse_numbers(numbers, delimiter)
    
    # Validate that there are no negative numbers in the parsed list.
    validate_no_negatives(num_list)
    
    # Return the sum of the numbers in the list.
    num_list.sum
  end

  private

  # Method to extract the delimiter and numbers part from the input string.
  def extract_delimiter_and_numbers(input)
    if input.start_with?(CUSTOM_DELIMITER_PREFIX)
      # Custom delimiter is specified, extract it.
      delimiter = input[2]
      # Remove the custom delimiter prefix and newline from the input string.
      numbers = input[4..]
    else
      # Use the default delimiter.
      delimiter = DEFAULT_DELIMITER
      # The numbers part remains the entire input string.
      numbers = input
    end
    # Return the delimiter and the modified numbers string.
    [delimiter, numbers]
  end

  # Method to parse the numbers string into an array of integers.
  def parse_numbers(numbers, delimiter)
    # Split the numbers string using the delimiter or newline, and convert each part to an integer.
    numbers.split(/#{Regexp.escape(delimiter)}|\n/).map(&:to_i)
  end

  # Method to check for and handle negative numbers in the parsed list.
  def validate_no_negatives(numbers)
    # Select all negative numbers from the list.
    negatives = numbers.select { |num| num < 0 }
    # Raise an error if any negative numbers are found, listing them in the error message.
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
  end
end
