#!/usr/bin/env ruby

require './day2/day2'

data = ARGF.lines
d = Day2.new(database: data)
#puts d.valid_passwords(rules: :old_job)
puts d.valid_passwords(rules: :new_job)
