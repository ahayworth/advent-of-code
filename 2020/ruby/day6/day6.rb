require 'set'

class Day6
  def self.parse_groups(data)
    data.split(/\n/)
      .slice_when { |a, b| a.empty? || b.empty? }
      .reject { |arr| arr == [""] }
      .map { |arr| arr.map(&:chars).flatten.tally }
  end

  def self.parse_consensus(data)
    data.split(/\n/)
      .slice_when { |a, b| a.empty? || b.empty? }
      .reject { |arr| arr == [""] }
      .map do |arr|
        sets = arr.map { |a| a.chars.to_set }
        sets.reduce(sets.shift) { |s, a| s & a }
      end
  end
end
