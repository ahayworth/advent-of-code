#!/usr/bin/env ruby

require './day6/day6'

input = ARGF.read
#groups = Day6.parse_groups(input)
#puts groups.map { |g| g.keys.count }.sum
groups = Day6.parse_consensus(input)
puts groups.map(&:size).sum
