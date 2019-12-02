=begin
--- Day 7: Some Assembly Required ---
This year, Santa brought little Bobby Tables a set of wires and bitwise logic gates! Unfortunately, little Bobby is a little under the recommended age range, and he needs help assembling the circuit.

Each wire has an identifier (some lowercase letters) and can carry a 16-bit signal (a number from 0 to 65535). A signal is provided to each wire by a gate, another wire, or some specific value. Each wire can only get a signal from one source, but can provide its signal to multiple destinations. A gate provides no signal until all of its inputs have a signal.

The included instructions booklet describes how to connect the parts together: x AND y -> z means to connect wires x and y to an AND gate, and then connect its output to wire z.

For example:

123 -> x means that the signal 123 is provided to wire x.
x AND y -> z means that the bitwise AND of wire x and wire y is provided to wire z.
p LSHIFT 2 -> q means that the value from wire p is from-shifted by 2 and then provided to wire q.
NOT e -> f means that the bitwise complement of the value from wire e is provided to wire f.
Other possible gates include OR (bitwise OR) and RSHIFT (to-shift). If, for some reason, you'd like to emulate the circuit instead, almost all programming languages (for example, C, JavaScript, or Python) provide operators for these gates.

For example, here is a simple circuit:

123 -> x
456 -> y
x AND y -> d
x OR y -> e
x LSHIFT 2 -> f
y RSHIFT 2 -> g
NOT x -> h
NOT y -> i
After it is run, these are the signals on the wires:

d: 72
e: 507
f: 492
g: 114
h: 65412
i: 65079
x: 123
y: 456
In little Bobby's kit's instructions booklet (provided as your puzzle input), what signal is ultimately provided to wire a?
=end

$substitution_table = {}

def make_substitution_table(file)
  file.each_line do |l|
    from, to = l.strip.split(' -> ') #Get both sides of the rule 
    from_arr = from.split(' ') #Get array of left side expression
    case from_arr[0]
    when /^\d+$/ #(series of digits)
      $substitution_table[to] = ["INT", from_arr[0]]
    when "NOT"
      $substitution_table[to] = ["NOT", from_arr[1]]
    when /^[a-z]+$/ #(series of lower case letters)
      case from_arr[1]
      when nil
        $substitution_table[to] = ["EQU", from_arr[0]]
      when "AND"
        $substitution_table[to] = ["AND", from_arr[0], from_arr[2]]
      when "OR"
        $substitution_table[to] = ["OR", from_arr[0], from_arr[2]]
      when "LSHIFT"
        $substitution_table[to] = ["LSHIFT", from_arr[0], from_arr[2]]
      when "RSHIFT"
        $substitution_table[to] = ["RSHIFT", from_arr[0], from_arr[2]]
      end
    end
  end
end

def evaluate(val)
  pp val
  case val
  when nil
    puts "Error, trying to evaluate nil!"
  when Integer
    return val
  when /^\d+$/ #(series of digits)
    return val.to_i
  when /^[a-z]+$/ #(series of lower case letters)
    return evaluate($substitution_table[val])
  when Array
    case val[0]
    when "INT"
      expr = val[1].to_i
    when "EQU"
      expr = evaluate(val[1])
    when "NOT"
      expr = ~(evaluate(val[1]))
    when "AND"
      expr = evaluate(val[1]) & evaluate(val[2])
    when "OR"
      expr = evaluate(val[1]) | evaluate(val[2])
    when "LSHIFT"
      expr = evaluate(val[1]) << evaluate(val[2])
    when "RSHIFT"
      expr = evaluate(val[1]) >> evaluate(val[2])
    end
    return expr
  end
end

file = File.open("day7_input")
make_substitution_table(file)

pp $substitution_table.sort

puts evaluate('a')

# def make_substitution_table(file)
#   file.each_line do |l|
#     from, to = l.strip.split(' -> ')
#     from_arr = from.split(' ')
#     case from_arr[0]
#     when /^\d+$/ #series of digits
#       $substitution_table << [to, from_arr[0]]
#     when "NOT"
#       $substitution_table << [to, "( ~#{from_arr[1]} )"]
#     when /^[a-z]+$/ #series of lower case letters
#       case from_arr[1]
#       when nil
#         $substitution_table << [to, " #{from_arr[0]} "]
#       when "AND"
#         $substitution_table << [to, "( #{from_arr[0]} & #{from_arr[2]} )"]
#       when "OR"
#         $substitution_table << [to, "( #{from_arr[0]} | #{from_arr[2]} )"]
#       when "LSHIFT"
#         $substitution_table << [to, "( #{from_arr[0]} << #{from_arr[2]} )"]
#       when "RSHIFT"
#         $substitution_table << [to, "( #{from_arr[0]} >> #{from_arr[2]} )"]
#       end
#     end
#   end
# end