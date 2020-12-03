require "day2/day2"

input = ARGF.gets_to_end.lines
d = Day2.new(input)
# puts d.valid_passwords(:old_rules)
puts d.valid_passwords(:new_rules)
