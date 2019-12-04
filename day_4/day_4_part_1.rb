input = File.read('./input4.txt').split('-').map(&:to_i)

range = input[0]..input[1]

@password_count = 0

def pair_of_numbers(password)
  password.to_s.split('').map(&:to_i).each_cons(2) do |a, b|
    return true if a == b
  end

  false
end

def numbers_never_go_down(password)
  password.to_s.split('').map(&:to_i).each_cons(2) do |a, b|
    return false if a > b
  end

  true
end

range.each do |password|
  next unless pair_of_numbers(password)
  next unless numbers_never_go_down(password)

  @password_count += 1
  puts password
end

puts "password count ##{@password_count}"
