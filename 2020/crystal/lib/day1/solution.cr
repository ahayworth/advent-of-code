require "day1/day1"

input = ARGF.gets_to_end.lines.map(&.to_i)
d = Day1.new(input)
#puts d.calculate_2020
puts d.calculate_2020(size: 3)
