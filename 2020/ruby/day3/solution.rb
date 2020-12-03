#!/usr/bin/env ruby

require './day3/day3'

data = ARGF.lines.map(&:strip)
d = Day3.new(forest: data)
#puts d.count_trees(right: 3, down: 1)

puts [
  d.count_trees(right: 1, down: 1),
  d.count_trees(right: 3, down: 1),
  d.count_trees(right: 5, down: 1),
  d.count_trees(right: 7, down: 1),
  d.count_trees(right: 1, down: 2),
].inject(&:*)
