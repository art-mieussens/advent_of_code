arr = []
for i in 0..999 do
  arr[i] = []
  for j in 0..999 do
    arr[i][j] = false
  end
end

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

file = File.open("day6_input")

file.each_line do |l|
  command = l.split(' ')
  case command[0]
  when 'turn'
    case command[1]
    when  'on'
      puts "turn on #{command[2]} through #{command[4]}" 
    when 'off'
      puts "turn off #{command[2]} through #{command[4]}"
    end
  when 'toggle'
    puts "toggle #{command[1]} through #{command[3]}"
  end 
end