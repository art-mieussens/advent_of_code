program = []
File.open("input.txt").each_line do |line|
    program << line
end

accumulator = 0
index = 0

instructions_ran = {}

until instructions_ran[index] do
    instructions_ran[index] = true
    case program[index].match(/^(...)/)[1]
    when "nop"
        puts "nop"
        index += 1
    when "acc"
        puts "acc"
        acc += program[index].match(/^....((?:\+|-)\d+)/)[1].to_i
        index += 1
        puts acc
    when "jmp"
        puts "jmp"
    end
end
