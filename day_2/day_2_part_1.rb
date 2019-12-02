input = File.read('./input2.txt').split(',').map(&:to_i)
# input = '1,9,10,3,2,3,11,0,99,30,40,50'.split(',').map(&:to_i)


input[1] = 12
input[2] = 2

def process_input(input, steps = 0)
  intcode = input[(steps * 4)...((steps * 4) + 4)]
  opcode = intcode[0]

  case opcode
  when 1
    input[intcode[3]] = input[intcode[1]] + input[intcode[2]]
  when 2
    input[intcode[3]] = input[intcode[1]] * input[intcode[2]]
  when 99
    return input
  end

  process_input(input, steps + 1)
end

result = process_input(input)

puts result[0]
