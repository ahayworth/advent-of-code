require './day3/day3'

RSpec.describe Day3 do
  let(:input) {
    %w(
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
    )
  }
  let(:day3) { Day3.new(forest: input) }

  describe '#count_trees' do
    it 'counts the right number of trees' do
      n = day3.count_trees(right: 3, down: 1)
      expect(n).to eq(7)
    end
  end
end
