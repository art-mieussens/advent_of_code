=begin

--- Day 5: Doesn't He Have Intern-Elves For This? ---
Santa needs help figuring out which strings in his text file are naughty or nice.

A nice string is one with all of the following properties:

It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.
For example:

ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...), a double letter (...dd...), and none of the disallowed substrings.
aaa is nice because it has at least three vowels and a double letter, even though the letters used by different rules overlap.
jchzalrnumimnmhp is naughty because it has no double letter.
haegwjzuvuyypxyu is naughty because it contains the string xy.
dvszwmarrgswjxmb is naughty because it contains only one vowel.
How many strings are nice?

=end

def has_at_leats_3_vowels?(str)
  str =~ /[aeiou].*[aeiou].*[aeiou]/
end

def has_letter_twice_in_a_row?(str)
  loop_limit = str.length - 2
  for i in (0..loop_limit)
    if str[i] == str[i+1]
      return true
    end
  end
  return false
end

def has_not_ab_cd_pq_xy?(str)
  str !~ /(ab|cd|pq|xy)/
end

def is_nice(str)
  has_at_leats_3_vowels?(str) &&
  has_letter_twice_in_a_row?(str) &&
  has_not_ab_cd_pq_xy?(str)
end

file = File.open("day5_input")

nice_counter = 0

file.each_line do |l|
  nice_counter += 1 if is_nice(l)
end

puts nice_counter

=begin

--- Part Two ---
Realizing the error of his ways, Santa has switched to a better model of determining whether a string is naughty or nice. None of the old rules apply, as they are all clearly ridiculous.

Now, a nice string is one with all of the following properties:

It contains a pair of any two letters that appears at least twice in the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
It contains at least one letter which repeats with exactly one letter between them, like xyx, abcdefeghi (efe), or even aaa.
For example:

qjhvhtzxzqqjkmpb is nice because is has a pair that appears twice (qj) and a letter that repeats with exactly one letter between them (zxz).
xxyxx is nice because it has a pair that appears twice and a letter that repeats with one between, even though the letters used by each rule overlap.
uurcxstgmygtbstg is naughty because it has a pair (tg) but no repeat with a single letter between them.
ieodomkazucvgmuy is naughty because it has a repeating letter with one between (odo), but no pair that appears twice.
How many strings are nice under these new rules?

=end

def has_letter_repeated_with_one_in_between(str)
  loop_limit = str.length - 3 #don't check two last characters
  for i in (0..loop_limit)
    if str[i] == str[i+2] #check if second character from this is the same
      return true
    end
  end
  return false
end

def has_repeated_non_overlapping_letters_pair(str)
  loop_limit = str.length - 4 #don't check last 3 charactes
  for i in (0..loop_limit)
    #check if remaining string after this two chars contains them
    if str[i+2..].include?(str[i..i+1])
      return true
    end
  end
  return false
end

def is_nice(str)
  has_letter_repeated_with_one_in_between(str) &&
  has_repeated_non_overlapping_letters_pair(str)
end

file = File.open("day5_input")

nice_counter = 0

file.each_line do |l|
  nice_counter += 1 if is_nice(l)
end

puts nice_counter