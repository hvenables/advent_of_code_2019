input = File.read('./input4.txt').split('-').map(&:to_i)

range = input[0]..input[1]

@password_count = 0

def pair_of_numbers
  @password.to_s.split('').map(&:to_i).each_cons(2) do |a, b|
    return true if a == b
  end

  false
end

def delete_three_or_more_letters
  @password.to_s.split('').map(&:to_i).each_cons(3) do |a, b, c|
    next unless [a, b, c].uniq.count == 1

    password_without_repeat = @password.to_s.split('').map(&:to_i)
    password_without_repeat.delete(a)
    @password = password_without_repeat.join('')

    break delete_three_or_more_letters
  end
end

def numbers_never_go_down
  @password.to_s.split('').map(&:to_i).each_cons(2) do |a, b|
    return false if a > b
  end

  true
end

range.each do |password|
  @password = password
  next unless numbers_never_go_down

  delete_three_or_more_letters
  next unless pair_of_numbers

  @password_count += 1
  puts password
end

puts "password count ##{@password_count}"

# error case - 666999
#
# 915 - to low
# 1344 - to high
