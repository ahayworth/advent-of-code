#!/usr/bin/env ruby

position = 50
steps = ARGF
  .each_line
  .map { |l| [l[0].to_sym, l[1..].to_i] }

zeros = 0
steps.each do |(d, n)|
  # print "%2d: #{d}%2d -> " % [position, n]
  n = -n if d == :L
  position = (position + n) % 100
  zeros += 1 if position == 0
  # puts position
end

puts zeros
