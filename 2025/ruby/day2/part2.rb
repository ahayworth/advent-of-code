#!/usr/bin/env ruby

ranges = ARGF
  .each_line
  .flat_map { |l| l.chomp.split(',') }
  .map { |r| r.split('-').map(&:to_i) }
  .map { |r| Range.new(*r) }

pattern = /^(\d+)\1+$/
total = ranges.sum do |r|
  r.sum do |n|
    n.to_s =~ pattern ? n : 0
  end
end

puts total
