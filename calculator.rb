class Calculator
  def add(numbers)
    return 0 if numbers.empty?
    return numbers.to_i if numbers.match(/^\d+$/)
    #if the input numbers starting with // then filter the input
    if numbers.start_with?("//")
      delimiter, numbers = extract_custom_delimiter(numbers)
    else
      #default delimiter is comma
      delimiter = ","
    end

    # Split numbers using the delimiter and newline characters. Also convert the string array to integer
    number_array = numbers.split(/#{Regexp.escape(delimiter)}|\n/).map(&:to_i)

    # This will Filter out numbers greater than 1000
    number_array = number_array.reject { |num| num > 1000 }

    # This mehtod will validate and handle negative  values
    validate_negatives(number_array)
    number_array.sum
  end

  private

  def extract_custom_delimiter(numbers)
    match = numbers.match(/^\/\/(.+)\n(.*)$/)
    raise ArgumentError, "Invalid custom delimiter format" unless match
    [match[1], match[2]]
  end

  def validate_negatives(number_array)
    #check for negotive numbers
    negatives = number_array.select { |num| num < 0 }
    raise ArgumentError, "Negatives not allowed: #{negatives.join(', ')}" if negatives.any?
  end
end
