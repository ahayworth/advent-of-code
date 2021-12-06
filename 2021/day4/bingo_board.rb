class BingoBoard
  # Expects a 2D array of numbers:
  # [
  #   [0,  15,  8,  9, 27],
  #   [10, 11, 23, 14,  2],
  #   ...
  # ]
  def initialize(rows)
    @board = {}

    rows.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        @board[col] = { row: row_idx, col: col_idx, marked: false }
      end
    end
  end

  def mark!(number)
    if @board[number]
      @board[number][:marked] = true
    end
  end

  def bingo?
    @board.group_by { |_, info| info[:row] }.each do |_, cells|
      if cells.all? { |(_, info)| info[:marked] }
        return true
      end
    end

    @board.group_by { |_, info| info[:col] }.each do |_, cells|
      if cells.all? { |(_, info)| info[:marked] }
        return true
      end
    end

    return false
  end

  def unmarked
    @board.select { |_, info| info[:marked] == false }.keys
  end

  def to_s
    rows = [
      "+-------------------+",
      "| B | I | N | G | O |",
      "+---+---+---+---+---+",
    ]
    (0..4).each do |n|
      r = @board.select { |_, i| i[:row] == n }.sort_by do |_, i|
        i[:col]
      end
      values = r.map { |n, info| [info[:marked] ? "*" : " ", n] }
      rows << sprintf("|%s%2d|%s%2d|%s%2d|%s%2d|%s%2d|", *values.flatten)
      rows <<         "+---+---+---+---+---+"
    end

    rows.join("\n")
  end
end

