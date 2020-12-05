class Day5
  def self.parse_boarding_pass(pass)
    rows = (0..127).to_a
    cols = (0..7).to_a

    parsed = {}
    pass[0..6].chars.each do |char|
      len = rows.length / 2
      if char == 'F'
        rows = rows[0..(len - 1)]
      elsif char == 'B'
        rows = rows[len..-1]
      end
    end
    parsed[:row] = rows.first

    pass[7..-1].chars.each do |char|
      len = cols.length / 2
      if char == 'L'
        cols = cols[0..(len - 1)]
      elsif char == 'R'
        cols = cols[len..-1]
      end
    end
    parsed[:column] = cols.first
    parsed[:id] = (parsed[:row] * 8) + parsed[:column]

    parsed
  end
end
