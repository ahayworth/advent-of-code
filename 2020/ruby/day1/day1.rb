class Day1
  attr_reader :expenses

  def initialize(expenses: [])
    @expenses = expenses
  end

  def calculate_2020(entries: 2)
    expenses
      .combination(entries)
      .find { |arr| arr.sum == 2020 }
      .inject(&:*)
  end
end
