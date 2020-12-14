chain = []

File.open('input.txt').each_line do |line|
  chain << line.to_i
end

chain.push(0)
chain.push(chain.max + 3)
chain.sort!
p chain

difs = chain.each_with_index.map { |num, i| chain[i + 1] ? chain[i + 1] - num : nil }.compact
p difs

p difs.select { |n| n == 1 }.length * difs.select { |n| n == 3 }.length

ways = []
dif_count = 0

difs.each do |dif|
  if dif == 1
    dif_count += 1
  elsif dif_count > 0
    case dif_count
    when 2
      ways << 2
    when 3
      ways << 4
    when 4
      ways << 7
    end
    dif_count = 0
  end
end

p ways.inject(:*)
