require './day6/day6'

RSpec.describe Day6 do
  let(:single_group) {
    "abc\nbcd"
  }

  let(:multi_group) {
    <<~EOS
      abc

      a
      b
      c

      ab
      ac

      a
      a
      a
      a

      b
    EOS
  }

  describe '#parse_groups' do
    it 'parses answers into groups correctly' do
      expect(Day6.parse_groups(single_group)).to eq([{
        "a" => 1, "b" => 2, "c" => 2, "d" => 1
      }])
    end

    it 'handles multiple groups' do
      expect(Day6.parse_groups(multi_group)).to eq([
        { "a" => 1, "b" => 1, "c" => 1 },
        { "a" => 1, "b" => 1, "c" => 1 },
        { "a" => 2, "b" => 1, "c" => 1 },
        { "a" => 4, },
        { "b" => 1 },
      ])
    end
  end

  describe '#parse_consensus' do
    it 'parses consensus correctly' do
      expect(Day6.parse_consensus(single_group)).to eq([
        ["b", "c"].to_set
      ])
    end

    it 'parses multiple consensuses correctly' do
      expect(Day6.parse_consensus(multi_group)).to eq([
        ["a", "b", "c"].to_set,
        [].to_set,
        ["a"].to_set,
        ["a"].to_set,
        ["b"].to_set,
      ])
    end
  end
end
