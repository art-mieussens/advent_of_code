class Program

    attr_accessor :program, :accumulator

    def initialize(input, chg_line)
        @program = []
        File.open(input).each_with_index do |line, i|
            if i+1 == chg_line
                puts i+1
                puts line
                line.sub!(/^(nop|jmp)/, {"nop" => "jmp", "jmp" => "nop"})
                puts line
                puts "--"
            end 
            @program << line
        end
        @accumulator = 0
        @index = 0
    end
        
    def run
        instructions_ran = {}
        until instructions_ran[@index] do
            instructions_ran[@index] = true
            par = @program[@index].match(/^....((?:\+|-)\d+)/)[1].to_i
            case @program[@index].match(/^(...)/)[1]
            when "nop"
                @index += 1
            when "acc"
                @accumulator += par
                @index += 1
            when "jmp"
                @index += par
            end
            if @index == @program.length
                return "ok"
            end
        end
        return "halted"
    end
end

(0..635).each do |chg_line|
    p = Program.new("input.txt", chg_line)
    r = p.run
    puts r
    if r == "ok"
        puts "changed_line: #{chg_line}"
        puts "accumulator: #{p.accumulator}"
        break
    end 
end

