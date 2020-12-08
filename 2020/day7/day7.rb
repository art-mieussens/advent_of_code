$rules = {}

File.open("input.txt").each_line do |line|
    bags = []
    line.slice(/contain (.+)/,1).split(/ bags?(?:,|.)? ?/).each do |s|
        if s == "no other"
            bags << {}
        else
            color = s.match(/^\d+ (.+)/)[1]
            number = s.match(/^\d+/)[0].to_i
            bags << { color => number }
        end
    end
    $rules[line.match(/^\S+ \S+/)[0]] = bags
end

def bags_containing(color)
    result = []
    $rules.each do |container_color, rule|
        rule.each do |r|
            result << container_color if r[color]
        end
    end
    return result
end

def containers(color)
    cont = {}
    bags_containing(color).each do |bag|
        cont[bag] = 1
        cont.merge! containers(bag)
    end
    return cont 
end

def bags_in(color)
    p $rules[color]
end

def bags_inside(color)
    count = 0
    bags_in(color).each do |bags|
        bags.each do |bag, num|
            count += num + num * bags_inside(bag)
        end
    end
    return count
end

puts containers("shiny gold").length

puts bags_inside("shiny gold")