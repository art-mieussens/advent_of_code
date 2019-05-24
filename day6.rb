=begin
--- Day 6: Probably a Fire Hazard ---
Because your neighbors keep defeating you in the holiday house decorating contest year after year, you've decided to deploy one million lights in a 1000x1000 grid.

Furthermore, because you've been especially nice this year, Santa has mailed you instructions on how to display the ideal lighting configuration.

Lights in your grid are numbered from 0 to 999 in each direction; the lights at each corner are at 0,0, 0,999, 999,999, and 999,0. The instructions include whether to turn on, turn off, or toggle various inclusive ranges given as coordinate pairs. Each coordinate pair represents opposite corners of a rectangle, inclusive; a coordinate pair like 0,0 through 2,2 therefore refers to 9 lights in a 3x3 square. The lights all start turned off.

To defeat your neighbors this year, all you have to do is set up your lights by doing the instructions Santa sent you in order.

For example:

turn on 0,0 through 999,999 would turn on (or leave on) every light.
toggle 0,0 through 999,0 would toggle the first line of 1000 lights, turning off the ones that were on, and turning on the ones that were off.
turn off 499,499 through 500,500 would turn off (or leave off) the middle four lights.
After following the instructions, how many lights are lit?

=end

class Grid

  def initialize
    @grid = []
    for i in 0..999 do
      @grid[i] = []
      for j in 0..999 do
        @grid[i][j] = false
      end
    end
  end

  def turn_on(coords)
    for i in (coords[0]..coords[2]) do
      for j in (coords[1]..coords[3]) do
        @grid[i][j] = true
        # puts "turn on #{i}, #{j}: #{@grid[i][j]}"
      end
    end
  end

  def turn_off(coords)
    for i in (coords[0]..coords[2]) do
      for j in (coords[1]..coords[3]) do
        @grid[i][j] = false
        # puts "turn off #{i}, #{j}: #{@grid[i][j]}"
      end
    end
  end

  def toggle(coords)
    for i in (coords[0]..coords[2]) do
      for j in (coords[1]..coords[3]) do
        @grid[i][j] = @grid[i][j] == true ? false : true
        # puts "toggle #{i}, #{j}: #{@grid[i][j]}"
      end
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

# This doesn't change
# def getcoords(command1, command2)
#   coords = command1.split(',') + command2.split(',')
#   coords.map {|c| c.to_i}
# end

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