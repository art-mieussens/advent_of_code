class Program
  def initialize(input)
    @program = []
    File.open(input).each_line do |line|
      @program << line
    end
    @accumulator = 0
    @index = 0
  end

  def run
    instructions_ran = {}
    until instructions_ran[@index]
      puts '----'
      puts "index: #{@index}"
      puts "instruction: #{@program[@index]}"
      instructions_ran[@index] = true
      par = @program[@index].match(/^....((?:\+|-)\d+)/)[1].to_i
      case @program[@index].match(/^(...)/)[1]
      when 'nop'
        @index += 1
      when 'acc'
        @accumulator += par
        @index += 1
      when 'jmp'
        @index += par
      end
    end
    puts '===='
    puts "index: #{@index}"
    puts "accumulator: #{@accumulator}"
    puts '===='
    if @index == @program.length + 1
      'program ended'
    else
      'program halted'
    end
  end
end

p = Program.new('input.txt')
p.run
