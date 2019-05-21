file = File.open("day_1_input")

floor = 0
position = 0
basement_position = 0

file.each_char do |c|
  position += 1
  case c
  when '('
    floor += 1
  when ')'
    floor -= 1
  end
  if basement_position == 0 && floor == -1
    basement_position = position
  end
end

puts floor
puts basement_position
