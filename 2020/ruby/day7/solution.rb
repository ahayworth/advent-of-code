#!/usr/bin/env ruby

require 'set'
require './day7/day7'

rules = Day7.new(ARGF.lines)

######################
# Part 1
######################
# def bag_level(color, rules)
#   rules.find_containers_for(color).inject({}) do |a, c|
#     a[c] = bag_level(c, rules)
#
#     a
#   end
# end
#
# def bag_keys(bag)
#   s = Set.new
#
#   bag.each do |k, v|
#     s << k
#     s << bag_keys(v)
#   end
#
#   s.flatten
# end
#
# bag_tree = bag_level("shiny gold", rules)
# puts bag_keys(bag_tree).count

def count_bags(color, rules)
  count = 0

  rules[color].each do |sub_color|
    count += 1
    count += count_bags(sub_color, rules)
  end

  count
end

puts count_bags("shiny gold", rules.rules)
