class Day3
  TREE = '#'

  def initialize(forest:)
    @forest = forest.map(&:chars)
  end

  def count_trees(right:, down:)
    x, y, trees = 0, 0, 0

    while y < (@forest.size - 1)
      x += right
      y += down
      break unless @forest[y]

      if x > (@forest[y].size - 1)
        x -= @forest[y].size
      end

      trees += 1 if @forest[y][x] == TREE
    end

    trees
  end
end
