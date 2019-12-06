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

def leg_direction(leg)
  leg[0] 
end

def leg_value(leg)
    leg[1..].to_i
end

def path_to_slist(path)

  def new_segment(p1, p2)
    [
      [ p1[0], p1[1] ],
      [ p2[0], p2[1] ]
    ]
  end

  list = []
  position = [0,0]
  new_position = [0,0]

  path.each do |leg|
    case leg_direction(leg)
    when 'U'
      new_position[1] = position[1] + leg_value(leg) 
    when 'D'
      new_position[1] = position[1] - leg_value(leg) 
    when 'R'
      new_position[0] = position[0] + leg_value(leg) 
    when 'L'
      new_position[0] = position[0] - leg_value(leg) 
    end
    list << new_segment(position, new_position)
    position = new_position.dup
  end
  list
end

p list1 = path_to_slist(path1)
p list2 = path_to_slist(path2)



