@base_map = Array.new(10000) { Array.new(10000) { '.' } }

wire_1, wire_2 = File.read('./input3.txt').split("\n").map { |wire| wire.split(',') }

# wire_1 = "R8,U5,L5,D3".split(',')
# wire_2 = "U7,R6,D4,L4".split(',')

# wire_1 = "R75,D30,R83,U83,L12,D49,R71,U7,L72".split(',')
# wire_2 = "U62,R66,U55,R34,D71,R55,D58,R83".split(',')

# wire_1 = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51".split(',')
# wire_2 = "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7".split(',')
@position = [1, 1]

def make_move(input)
  direction = input[0]
  spaces = input[1..-1].to_i

  case direction
  when 'R'
    @position[1].upto(@position[1] + (spaces - 1)).each do |y|
      @base_map[@position[0]][y] = @base_map[@position[0]][y] == '.' ? '_' : 'X'
    end
    @position = [@position[0], @position[1] + spaces]
  when 'L'
    @position[1].downto(@position[1] - (spaces - 1)).each do |y|
      @base_map[@position[0]][y] = @base_map[@position[0]][y] == '.' ? '_' : 'X'
    end
    @position = [@position[0], @position[1] - spaces]
  when 'U'
    @position[0].upto(@position[0] + (spaces - 1)).each do |x|
      @base_map[x][@position[1]] = @base_map[x][@position[1]] == '.' ? '|' : 'X'
    end
    @position = [@position[0] + spaces, @position[1]]
  when 'D'
    @position[0].downto(@position[0] - (spaces - 1)).each do |x|
      @base_map[x][@position[1]] = @base_map[x][@position[1]] == '.' ? '|' : 'X'
    end
    @position = [@position[0] - spaces, @position[1]]
  end
end

wire_1.each do |move|
  make_move(move)
end

@position = [1,1]

wire_2.each do |move|
  make_move(move)
end

10000.times do |x|
  10000.times do |y|
    p [x - 1, y - 1, (x-1)+(y-1)] if @base_map[x][y] == 'X' && [x,y] != [1,1]
  end
end

# puts @base_map.map { |x| x.join(' ') }
