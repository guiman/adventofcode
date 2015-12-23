class RangeChecker
  def self.match(start, finish, checker)
    solution = -1
    p "#{start} .. #{finish}"
    (start..finish).to_a.each do |current|
      solution = checker.match? current
      p current if current == "3938038"
      break solution unless solution.nil?
    end
    solution
  end
end
