class Day1
  def initialize(@input : Array(Int32)); end

  def calculate_2020(size = 2)
    match = @input
      .combinations(size)
      .find { |arr| arr.sum == 2020 }

    match ? match.product : nil
  end
end
