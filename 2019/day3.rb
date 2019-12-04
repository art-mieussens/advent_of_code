#read path1 from file
#read path2 from file

str1, str2 = File.read("day3.input").split("\n")

p path1 = str1.split(',')
p path2 = str2.split(',')

#populate grid1 using path1
#populate grid2 using path2

#make list of coincidence points
#calculate manhattan distance for every point in the list 
#find the smallest distance in the list
