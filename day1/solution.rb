#!/usr/bin/env ruby

require './day1/day1'

d = Day1.new(expenses: ARGF.lines.map(&:to_i))

# puts d.calculate_2020
puts d.calculate_2020(entries: 3)
