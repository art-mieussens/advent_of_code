expenses = []

File.open('input.txt').each do |line|
  expenses << line.to_i
end

expenses.sort!

# result = 0
# first = 0
# second = 0

# expenses.each_with_index do |a,i|
#     expenses.each_with_index do |b,j|

#         if a + b == 2020
#             first = a
#             second = b
#             result = a * b
#             break
#         end
#     end
# end

result = 0
first = 0
second = 0
third = 0

expenses.each_with_index do |a, _i|
  expenses.each_with_index do |b, _j|
    expenses.each_with_index do |c, _k|
      next unless a + b + c == 2020

      first = a
      second = b
      third = c
      result = a * b * c
      break
    end
  end
end

puts first
puts second
puts third
puts result
