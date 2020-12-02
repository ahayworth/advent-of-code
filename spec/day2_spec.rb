require './day2/day2'

RSpec.describe Day2 do
  let(:input) {
    [
      "1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc",
    ]
  }
  let(:day2) { Day2.new(database: input) }

  describe '#valid_passwords' do
    describe 'with the rules from the old job' do
      it 'returns the correct number of valid passwords' do
        expect(day2.valid_passwords(rules: :old_job)).to eq(2)
      end
    end

    describe 'with the rules from the new job' do
      it 'returns the correct number of valid passwords' do
        expect(day2.valid_passwords(rules: :new_job)).to eq(1)
      end

      # I originally had an off-by-one error but because
      # of how ruby's #count works, it passed the test suite
      it 'returns zero with no valid passwords' do
        i = ["2-9 c: ccccccccc"]
        d = Day2.new(database: i)
        expect(d.valid_passwords(rules: :new_job)).to eq(0)
      end
    end
  end
end
