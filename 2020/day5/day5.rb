boarding_passes = Array.new

File.open("input.txt").each do |line|
    line_bin = line.gsub(/(B|R)/, "1").gsub(/(F|L)/, "0")
    row = line_bin.slice(0,7).to_i(2)
    col = line_bin.slice(7,3).to_i(2)
    seat_id = row * 8 + col
    boarding_passes << seat_id
end

boarding_passes.sort!

puts "Max BP id: #{boarding_passes.max}"

boarding_passes.each_with_index do |bp, i|
    puts "My BP id: #{bp + 1}" if boarding_passes[i+1] && boarding_passes[i+1] != bp + 1
end 

