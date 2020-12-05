#!/usr/bin/env ruby

require './day4/day4'

input = ARGF.read
batch = Day4.parse_batch(input)
#puts batch.count { |p| Day4.fields_present?(p) }
puts batch.count { |p| Day4.valid_passport?(p) }
