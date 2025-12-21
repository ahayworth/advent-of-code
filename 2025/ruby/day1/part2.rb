#!/usr/bin/env ruby

position = 50
steps = ARGF
  .each_line
  .map { |l| [l[0].to_sym, l[1..].to_i] }

zeros = 0
steps.each do |(d, n)|
  threshold = if position == 0
                100
              elsif d == :L
                position
              else
                100 - position
              end

  old_position = position
  raw_position = position + (d == :L ? -n : n)
  position     = raw_position % 100

  if n >= threshold
    zeros += 1
    zeros += (n - threshold) / 100
  end

  if ENV["DEBUG"]
    puts <<~EOF
      #{old_position}: #{d}#{n}
        -> raw_position: #{raw_position}
           new position: #{position}
              threshold: #{threshold}
                  zeros: #{zeros}
    EOF
  end
end

puts zeros
