require_relative 'lib/checker'
require_relative 'lib/range_checker'

number = 0
block_size = 100_000
checker = Checker.new(ARGV[0])
arr = []
solution = -1
THREAD_COUNT = 4

loop do
  THREAD_COUNT.times do |i|
    arr[i] = Thread.new do
      my_block = (block_size / THREAD_COUNT) * (i+1)
      start = number + my_block
      Thread.current["result"] = RangeChecker.match(start, start + my_block, checker)
    end
  end

  potential_results = arr.map { |thr| thr.join; thr["result"] }.compact

  if potential_results.any?
    solution = potential_results.min
    break
  else
    number += block_size
  end
end

p "Found it: #{solution}"
