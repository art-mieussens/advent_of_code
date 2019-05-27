# Initialize array
arr = []
for i in 0..999 do
  arr[i] = []
  for j in 0..999 do
    arr[i][j] = false
  end

# Methods to modify a range

def turn_on(x1,y1,x2,y2)
  for i in (x1..x2) do
    for j in (y1..y2) do
      arr[i][j] = true
    end
  end

  def count
    counter = 0
    for i in 0..999 do
      for j in 0..999 do
        counter += 1 if @grid[i][j] == true
        # puts "count #{counter}"
      end
    end
    return counter
  end

end

def getcoords(command1, command2)
  coords = command1.split(',') + command2.split(',')
  coords.map {|c| c.to_i}
end

mygrid = Grid.new

file = File.open("day6_input")

file.each_line do |l|
  command = l.split(' ')
  case command[0]
  when 'turn'
    case command[1]
    when  'on'
      mygrid.turn_on(getcoords(command[2], command[4]))
    when 'off'
      mygrid.turn_off(getcoords(command[2], command[4]))
    end
  when 'toggle'
    mygrid.toggle(getcoords(command[1], command[3]))
  end
end

puts mygrid.count

=begin

--- Part Two ---
You just finish implementing your winning light pattern when you realize you mistranslated Santa's message from Ancient Nordic Elvish.

The light grid you bought actually has individual brightness controls; each light can have a brightness of zero or more. The lights all start at zero.

The phrase turn on actually means that you should increase the brightness of those lights by 1.

The phrase turn off actually means that you should decrease the brightness of those lights by 1, to a minimum of zero.

The phrase toggle actually means that you should increase the brightness of those lights by 2.

What is the total brightness of all lights combined after following Santa's instructions?

For example:

turn on 0,0 through 0,0 would increase the total brightness by 1.
toggle 0,0 through 999,999 would increase the total brightness by 2000000.

=end


class Grid

  def initialize
    @grid = []
    for i in 0..999 do
      @grid[i] = []
      for j in 0..999 do
        @grid[i][j] = 0
      end
    end
  end

  def turn_on(coords)
    for i in (coords[0]..coords[2]) do
      for j in (coords[1]..coords[3]) do
        @grid[i][j] += 1
      end
    end
  end

  def turn_off(coords)
    for i in (coords[0]..coords[2]) do
      for j in (coords[1]..coords[3]) do
        @grid[i][j] -= 1 if @grid[i][j] >= 1
      end
    end
  end

  def toggle(coords)
    for i in (coords[0]..coords[2]) do
      for j in (coords[1]..coords[3]) do
        @grid[i][j] += 2
      end
    end
  end

  def count
    counter = 0
    for i in 0..999 do
      for j in 0..999 do
        counter += @grid[i][j]
      end
    end
    return counter
  end

end

# Initialize range parameters
x1, x2, y1, y2 = 0, 0, 0, 0

# Get coordinates from comma separated strings on ints
def getcoords(command1, command2)
  x1, y1 = command1.split(',').map{ |c| c.to_i }
  x2, y2 = command2.split(',').map{ |c| c.to_i }
end

file = File.open("day6_input")

file.each_line do |l|
  # Parse the instructions and call modifier methods
  command = l.split(' ')
  case command[0]
  when 'turn'
    case command[1]
    when  'on'
      getcoords(command[3], command[5])
      turn_on(x1,y1,x2,y2)
    when 'off'
      getcoords(command[3], command[5])
      turn_off(x1,y1,x2,y2)
    end
  when 'toggle'
    getcoords(command[2], command[4])
    toggle(x1,y1,x2,y2)
  end 
end

# Count lights on
counter = 0
for i in 0..999 do
  arr[i] = []
  for j in 0..999 do
    counter += 1 if arr[i][j] = true
  end
end

puts counter
