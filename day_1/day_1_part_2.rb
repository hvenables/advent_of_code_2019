input = File.read('./input1.txt').split("\n")

def calculate_fuel(input, total = 0)
  fuel_needed_for_input = (input.to_i / 3) - 2

  return total unless fuel_needed_for_input.positive?

  calculate_fuel(fuel_needed_for_input, total + fuel_needed_for_input)
end

result = input.sum { |i| calculate_fuel(i) }

puts result
