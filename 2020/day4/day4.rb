MATCH = /(byr|iyr|eyr|hgt|hcl|ecl|pid):(\S+)/.freeze

def valid_byr?(byr)
  (1920..2002).include?(byr.to_i)
end

def valid_iyr?(iyr)
  (2010..2020).include?(iyr.to_i)
end

def valid_eyr?(eyr)
  (2020..2030).include?(eyr.to_i)
end

def valid_hgt?(hgt)
  hgt.match(/(^\d\d)in$/) do |m|
    return (59..76).include?(m[1].to_i)
  end
  hgt.match(/(^\d\d\d)cm$/) do |m|
    return (150..193).include?(m[1].to_i)
  end
  false
end

def valid_hcl?(hcl)
  hcl.match?(/^#([0-9]|[a-f]){6}$/)
end

def valid_ecl?(ecl)
  ecl.match?(/^(amb|blu|brn|gry|grn|hzl|oth)$/)
end

def valid_pid?(pid)
  pid.match?(/^\d{9}$/)
end

def valid?(m)
  case m[0]
  when 'byr'
    valid_byr?(m[1])
  when 'iyr'
    valid_iyr?(m[1])
  when 'eyr'
    valid_eyr?(m[1])
  when 'hgt'
    valid_hgt?(m[1])
  when 'hcl'
    valid_hcl?(m[1])
  when 'ecl'
    valid_ecl?(m[1])
  when 'pid'
    valid_pid?(m[1])
  end
end

valid_passports = 0

current_passport = []

File.open('input.txt').each_line do |line|
  if line.match?(/^\s+$/)
    valid_passports += 1 if current_passport.length == 7
    current_passport = []
  else
    line.scan(MATCH).each do |m|
      current_passport << m if valid?(m)
    end
  end
end

puts valid_passports
