#read path1 from file
#read path2 from file

str1, str2 = File.read("day3.input").split("\n")

path1 = str1.split(',')
path2 = str2.split(',')

#transform paths into lists of segments
#[
#  [ [0,0],[6,0] ],
#  [ [6,0],[6,5] ],
#  ...
#]

list1 = []
list2 = []

def leg_direction(leg)
  leg[0] 
end

def leg_value(leg)
    leg[1..].to_i
end

def path_to_slist(path)
  x = 0
  y = 1
  list = []
  position = [0,0]
  new_position = [0,0]

  def new_segment
    [
      [ position[x], position[y] ],
      [ new_position[x], new_position [y] ]
    ]

  path.each do |leg|
    case leg_direction(leg)
    when 'u'
      new_position[x] = position[x] + leg_value(leg) 
      list << new_segment
    when 'd'
      new_position[x] = position[x] + leg_value(leg) 
      list << new_segment
    when 'r'
      new_position[x] = position[x] + leg_value(leg) 
      list << new_segment
    when 'l'
      new_position[x] = position[x] + leg_value(leg) 
      list << new_segment
    end
    list
  end
end

p list1 = path_to_slist(path1)
