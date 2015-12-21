require 'digest'

number = 0
block_size = 100000
solution = -1
key = '%{key}%{number}'

arr = []
loop do
  4.times do |i|
    arr[i] = Thread.new {
      start = number + (block_size * i)
      finish = start + block_size
      (start..finish).to_a.each do |current|
        test = key % { number: current, key: ARGV[0] }
        data = Digest::MD5.hexdigest(test).to_s
        if data[0..5] == "000000"
          Thread.current["result"] = current
          break
        end
      end
    }
  end

  potential_results = []

  arr.each do |thr|
    thr.join
    if !thr["result"].nil?
      potential_results << thr["result"]
    end
  end

  if potential_results.any?
    solution = potential_results.min
    break
  else
    number += (block_size * 4)
  end
end

p "Found it: #{solution}"
