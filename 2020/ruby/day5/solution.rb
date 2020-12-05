#!/usr/bin/env ruby

require './day5/day5'

passes = ARGF.lines.map { |l| Day5.parse_boarding_pass(l.strip) }
#puts passes.max_by { |p| p[:id] }[:id]

ids = passes.map { |p| p[:id] }
min, max = ids.minmax
puts (min..max).sum - ids.sum
