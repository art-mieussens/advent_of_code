def calculate_fuel(mass)
    mass.to_i / 3 - 2
end 

modules_fuel = 0

File.open('day1.input').each do |line|
   modules_fuel += calculate_fuel(line.to_i)
end

puts "Total fuel required by modules: #{modules_fuel}"

def calculate_fuel_r(mass)
    module_fuel = fuel = calculate_fuel(mass)
    while ( fuel = calculate_fuel(fuel) ) > 0 do
        module_fuel += fuel
    end
    return module_fuel
end

modules_fuel_2 = 0

File.open('day1.input').each do |line|
    modules_fuel_2 += calculate_fuel_r(line.to_i) 
end

puts "Total fuel required by modules and fuel: #{modules_fuel_2}"
