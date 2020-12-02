class Day2
  attr_reader :database

  def initialize(database:)
    @database = database
  end

  def valid_passwords(rules: :new_job)
    @database.count do |row|
      rule, password = row.split(":").map(&:strip)

      if rules == :old_job
        valid_by_old_job(rule, password)
      else
        valid_by_new_job(rule, password)
      end
    end
  end

  private
  def valid_by_old_job(rule, password)
    quantity_req, char = rule.split(" ")
    quantity_min, quantity_max = quantity_req.split("-").map(&:to_i)

    count = password.count(char)
    count >= quantity_min && count <= quantity_max
  end

  def valid_by_new_job(rule, password)
    position_req, char = rule.split(" ")
    # Offsets are not zero-indexed in the database.
    idx1, idx2 = position_req.split("-").map { |c| c.to_i - 1 }

    (password[idx1] == char && password[idx2] != char) ||
      (password[idx1] != char && password[idx2] == char)
  end
end
