class Day2
  def initialize(@database : Array(String)); end

  def valid_passwords(rules)
    @database.count do |row|
      match = row.match(/^(?<n1>\d+)-(?<n2>\d+)\s(?<char>\w):\s(?<password>\w+)$/)
      if match
        password, c = match["password"], match["char"]

        if rules == :old_rules
          min, max = match["n1"].to_i, match["n2"].to_i
          count = password.count(c)

          count >= min && count <= max
        else # new_rules
          idx1, idx2 = match["n1"].to_i - 1, match["n2"].to_i - 1

          (password[idx1, 1] == c || password[idx2, 1] == c) &&
            password[idx1, 1] != password[idx2, 1]
        end
      end
    end
  end
end
