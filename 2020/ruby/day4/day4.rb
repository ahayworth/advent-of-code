require 'set'

class Day4
  REQUIRED_FIELDS = Set.new([
    "byr",
    "iyr",
    "eyr",
    "hgt",
    "hcl",
    "ecl",
    "pid",
    "cid",
  ])
  NORTH_POLE_EXCEPTIONS = ["cid"]

  def self.fields_present?(passport)
    missing_fields = passport.keys.to_set ^ REQUIRED_FIELDS

    missing_fields.empty? || missing_fields.all? { |mf| NORTH_POLE_EXCEPTIONS.include?(mf) }
  end

  def self.parse_batch(data)
    data.split(/\n/)
      .slice_when { |a, b| a.empty? || b.empty? }
      .reject { |arr| arr == [""] }
      .map { |arr| arr.flat_map(&:split) }
      .map { |arr| arr.map { |f| f.split(":") }.to_h }
  end

  VALID_ECL = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth" ]
  def self.valid_passport?(passport)
    (passport["byr"].to_i >= 1920 && passport["byr"].to_i <= 2002) &&
    (passport["iyr"].to_i >= 2010 && passport["iyr"].to_i <= 2020) &&
    (passport["eyr"].to_i >= 2020 && passport["eyr"].to_i <= 2030) &&
    valid_hgt?(passport) &&
    passport["hcl"].to_s.match?(/^#[0-9a-f]{6}$/) &&
    VALID_ECL.include?(passport["ecl"]) &&
    passport["pid"].to_s.match?(/^\d{9}$/)
  end

  private
  def self.valid_hgt?(passport)
    hgt = passport["hgt"]
    return false if hgt.nil? || hgt.empty?

    if hgt.match?(/\d+in/)
      n = hgt.sub('in', '').to_i
      n >= 59 && n <= 76
    elsif hgt.match?(/\d+cm/)
      n = hgt.sub('cm', '').to_i
      n >= 150 && n <= 193
    else
      false
    end
  end
end
