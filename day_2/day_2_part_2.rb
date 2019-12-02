def process_input(input, steps = 0)
  intcode = input[(steps * 4)...((steps * 4) + 4)]
  opcode = intcode[0]

  return 0 if input[1] == 14

  case opcode
  when 1
    input[intcode[3]] = input[intcode[1]] + input[intcode[2]]
  when 2
    input[intcode[3]] = input[intcode[1]] * input[intcode[2]]
  when 99
    return input[0]
  end

  process_input(input, steps + 1)
end

noun = 1
verb = 1
result = 0

while result != 19690720
  puts "attempt: noun ##{noun} verb ##{verb}"
  puts "old result: #{result}"

  input = File.read('./input2.txt').split(',').map(&:to_i)

  input[1] = noun
  input[2] = verb

  result = process_input(input)

  if result != 19690720
    if noun > 100
      puts 'no solution'
      raise
    end

    if verb > 100
      verb = 1
      noun += 1
    else
      verb += 1
    end
  end
end

puts '-------------------------------'
puts result
puts noun
puts verb

puts "result is #{(100 * noun) + verb}"
