FORMAT = /(\d+)-(\d+) (.): (.*)/

passwords = []

File.open("input2.txt").each do |line|
  m = line.match(FORMAT)
  passwords <<  [ m[1].to_i,
                  m[2].to_i,
                  m[3],
                  m[4] ] 
end

q1 = passwords.filter {|p| (p[0]..p[1]).include?(p[3].count(p[2])) }

puts q1.count

q2 = passwords.filter do |p|
  arr = p[3].split('')
  arr[p[0]-1] != arr[p[1]-1] && ( arr[p[0]-1] == p[2] || arr[p[1]-1] == p[2] )
end

puts q2.count