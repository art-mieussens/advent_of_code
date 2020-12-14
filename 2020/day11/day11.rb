# frozen_string_literal: true

# A model of the seating floor
class Floor
  attr_accessor :floor

  def initialize(input)
    if input.instance_of?(String)
      @floor = Floor.readfloor(input)
    elsif input.instance_of?(Floor)
      @floor = input.floor
    end
  end

  def self.readfloor(input)
    floor = []
    File.open(input).each_line do |line|
      floor << line.chomp.split('')
    end
    floor
  end

  def switchseat(row, col)
    case @floor[row][col]
    when 'L'
      @floor[row][col] = '#'
    when '#'
      @floor[row][col] = 'L'
    end
  end

  def ==(other)
    @floor == other.floor
  end

  def count_occupied_seats
    count = 0
    @floor.each do |row|
      row.each do |seat|
        count += 1 if seat == '#'
      end
    end
    count
  end

  def seat
    new_floor = Floor.new(self)
    new_floor.each_with_index do |row, ri|
      row.each_with_index do |seat, si|
        if new_floor.floor ==
  end

end

floor = Floor.new("input.txt")

next_floor = floor.seat
if next_floor == floor
  puts floor.count_occupied_seats
  break
end
