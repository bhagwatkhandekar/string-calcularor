class Calculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2..])
      numbers = parts[1]
    end

    number_list = numbers.split(/#{delimiter}/).map(&:to_i)
    
    negatives = number_list.select { |number| number < 0 }
    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    number_list.sum
  end
end