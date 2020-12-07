def tree?(line, pos)
  line[pos % (line.length - 1)] == "#"
end

def count_trees(right, down)
  f = File.open("input.txt")

  sum = 0
  x_pos = 0

  f.each_with_index do |line, i|
    if i % down == 0
      sum += 1 if tree?(line, x_pos)
      x_pos += right
    end
  end

  f.close
  puts "slope: #{right}, #{down} - #{sum}"
end

[[1,1],[3,1],[5,1],[7,1],[1,2]].each {|n| count_trees(n[0],n[1])} 
