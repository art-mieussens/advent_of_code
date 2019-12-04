program = File.read('day2.input').split(',').map {|s| s.strip.to_i}

# restore program to "1202 alarm state"
program[1] = 12
program[2] = 2

def run_intcode(program)
  catch (:exit) do
    program.each_slice(4) do |a|
      case a[0]
      when 99
        throw :exit
      when 1
        program[a[3]] = program[a[1]] + program[a[2]]
      when 2
        program[a[3]] = program[a[1]] * program[a[2]]
      else
        raise "program error"
      end
    end
  end
end

run_intcode(program)

puts "Value on position 0 after the program halts is: #{program[0]}"


goal = 19690720

for noun in 0..99 do
  for verb in 0..99 do
    program = File.read('day2.input').split(',').map {|s| s.strip.to_i}
    program[1] = noun
    program[2] = verb
    puts "#{noun}, #{verb}"
    run_intcode(program)
    if program[0] == goal
      puts "answer is: #{100 * noun + verb}"
      exit
    end
  end
end
