input = File.read('./input1.txt').split("\n")

result = input.sum { |i| (i.to_i / 3) - 2 }

puts result
