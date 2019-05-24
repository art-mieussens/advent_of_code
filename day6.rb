# Initialize array
arr = []
for i in 0..999 do
  arr[i] = []
  for j in 0..999 do
    arr[i][j] = false
  end
end

# Methods to modify a range

def turn_on(x1,y1,x2,y2)
  for i in (x1..x2) do
    for j in (y1..y2) do
      arr[i][j] = true
    end
  end
end

def turn_off(x1,y1,x2,y2)
  for i in (x1..x2) do
    for j in (y1..y2) do
      arr[i][j] = false
    end
  end
end

def toggle(x1,y1,x2,y2)
  for i in (x1..x2) do
    for j in (y1..y2) do
      arr[i][j] = arr[i][j] == true ? false : true
    end
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