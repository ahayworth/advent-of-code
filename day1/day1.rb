#!/usr/bin/env ruby

#DESIRED_ENTRIES = 2
DESIRED_ENTRIES = 3

expense_report = ARGF.lines.map(&:to_i)
match = expense_report
  .combination(DESIRED_ENTRIES)
  .find { |arr| arr.inject(&:+) == 2020 }

puts match.inject(&:*)
