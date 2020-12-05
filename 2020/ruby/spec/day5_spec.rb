require './day5/day5'

RSpec.describe Day5 do
  describe '#parse_boarding_pass' do
    it 'parses correctly' do
      expect(Day5.parse_boarding_pass('FBFBBFFRLR')).to eq({
        row: 44, column: 5, id: 357
      })

      expect(Day5.parse_boarding_pass('BFFFBBFRRR')).to eq({
        row: 70, column: 7, id: 567
      })

      expect(Day5.parse_boarding_pass('FFFBBBFRRR')).to eq({
        row: 14, column: 7, id: 119
      })

      expect(Day5.parse_boarding_pass('BBFFBBFRLL')).to eq({
        row: 102, column: 4, id: 820
      })
    end
  end
end
