=begin

--- Day 3: Perfectly Spherical Houses in a Vacuum ---
Santa is delivering presents to an infinite two-dimensional grid of houses.

He begins by delivering a present to the house at his starting location, and then an elf at the North Pole calls him via radio and tells him where to move next. Moves are always exactly one house to the north (^), south (v), east (>), or west (<). After each move, he delivers another present to the house at his new location.

However, the elf back at the north pole has had a little too much eggnog, and so his directions are a little off, and Santa ends up visiting some houses more than once. How many houses receive at least one present?

For example:

> delivers presents to 2 houses: one at the starting location, and one to the east.
^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.
^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses.

--- Part Two ---
The next year, to speed up the process, Santa creates a robot version of himself, Robo-Santa, to deliver presents with him.

Santa and Robo-Santa start at the same location (delivering two presents to the same starting house), then take turns moving based on instructions from the elf, who is eggnoggedly reading from the same script as the previous year.

This year, how many houses receive at least one present?

For example:

^v delivers presents to 3 houses, because Santa goes north, and then Robo-Santa goes south.
^>v< now delivers presents to 3 houses, and Santa and Robo-Santa end up back where they started.
^v^v^v^v^v now delivers presents to 11 houses, with Santa going one direction and Robo-Santa going the other.

=end

position = [0,0] # [x,y]
visited_houses = { [0,0] => true }

file = File.open("day3_input")

file.each_char do |c|
  case c
  when '>'
    position[0] += 1 
  when '^'
    position[1] += 1
  when '<'
    position[0] -= 1
  when 'v'
    position[1] -= 1
  end
  visited_houses[position] = true
end

puts visited_houses.length

# Part 2

santa_position = [0,0]
robot_position = [0,0]
visited_houses_part2 = { santa_position.hash => true , robot_position.hash => true}
# Had to use hashes as the arrays were not being as unique and  there were duplicate entries in the hash

turn = :santa

file_again = File.open("day3_input")

file_again.each_char do |c|
  case c
  when '>'
    if turn == :santa
      santa_position[0] += 1
    else
      robot_position[0] += 1
    end
  when '^'
    if turn == :santa
      santa_position[1] += 1
    else
      robot_position[1] += 1
    end
  when '<'
    if turn == :santa
      santa_position[0] -= 1
    else
      robot_position[0] -= 1
    end
  when 'v'
    if turn == :santa
      santa_position[1] -= 1
    else
      robot_position[1] -= 1
    end
  end

  if turn == :santa
    visited_houses_part2[santa_position.hash] = true
    turn = :robot
  else
    visited_houses_part2[robot_position.hash] = true
    turn = :santa
  end

  # puts turn
  # puts c
  # puts santa_position[0], santa_position[1]
  # puts robot_position[0], robot_position[1]
  # puts visited_houses_part2.length

end

puts visited_houses_part2.length