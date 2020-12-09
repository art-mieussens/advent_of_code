program = []
File.open("input.txt").each_line do |line|
    program << line
end

index_after_last = program.length + 1

def run_program
    accumulator = 0
    index = 0

    instructions_ran = {}

    until instructions_ran[index] do
        puts "----"
        puts "index: #{index}"
        puts "instruction: #{program[index]}"
        instructions_ran[index] = true
        par = program[index].match(/^....((?:\+|-)\d+)/)[1].to_i
        case program[index].match(/^(...)/)[1]
        when "nop"
            index += 1
        when "acc"
            accumulator += par
            index += 1
        when "jmp"
            index += par
        end
    end
    puts "===="
    puts "index: #{index}"
    puts "accumulator: #{accumulator}"
    puts "===="
    if index == index_after_last
        return "program ended"
    else
        return "program halted"
    end
end