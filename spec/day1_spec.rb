require './day1/day1'

RSpec.describe Day1 do
  let(:input) { [ 1721, 979, 366, 299, 675, 1456 ] }
  let(:day1) { Day1.new(expenses: input) }

  describe '#calculate_2020' do
    it 'multiples a pair that sums to 2020' do
      expect(day1.calculate_2020).to eq(514579)
    end

    it 'multiplies a triple that sums to 2020' do
      expect(day1.calculate_2020(entries: 3)).to eq(241861950)
    end
  end
end
