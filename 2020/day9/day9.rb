

f = File.open("input.txt")

prev_25 = []
invalid_number = nil

(0..24).each do |i|
    prev_25[i] = f.gets.chomp.to_i
end

def not_sum_of_pair(array, num)
    comb = array.combination(2).map {|arr| arr.sum}
    result = comb.include?(num)
    return !result
end

loop do
    if f.eof?
        puts "eof"
        break
    else
        num = f.readline.chomp.to_i
    end
    if not_sum_of_pair(prev_25, num)
        invalid_number = num
        puts "invalid number: #{invalid_number}"
        break
    end
    prev_25.push(num)
    prev_25.shift
end
f.close

numbers = []
File.open("input.txt").each_line do |line|
    numbers << line.chomp.to_i
end
p numbers

list_size = numbers.length

(2..(list_size - 1)).each do |sublist_size|
    (0..(list_size - sublist_size - 1)).each do |index|
        slice = numbers.slice(index, sublist_size)
        if slice.sum == invalid_number
            puts "weakness: #{slice.first + slice.last}"
            break
        end
    end
end

