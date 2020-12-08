require 'set'

class Day7
  attr_reader :rules

  def initialize(input)
    @rules = input.each_with_object({}) do |line, rules|
      bag_color, possibilities = line.split("bags contain").map(&:strip)
      rules[bag_color] ||= []

      next if possibilities.match?(/no other bags/)
      possibilities.split(", ").map(&:strip).each do |possibility|
        match = possibility.match(/(?<count>\d+)\s(?<color>[\w\s]+)\sbags?\.?/)
        if match
          rules[bag_color] += [match[:color].strip] * match[:count].to_i
        end
      end
    end
  end

  def find_containers_for(color)
    containers = Set.new
    @rules.each do |bag_color, can_contain|
      containers << bag_color if can_contain.include?(color)
    end

    containers
  end
end
