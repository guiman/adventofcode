require 'digest'

number = 0
key = '%{key}%{number}'

loop do
  test = key % { number: number, key: ARGV[0] }
  data = Digest::MD5.hexdigest(test).to_s
  break if data[0..5] == "000000"
  number += 1
end
p "Found it: #{number}"
