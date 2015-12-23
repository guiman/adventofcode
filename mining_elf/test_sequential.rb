require 'digest'
number = 0
key = ARGV[0]
loop do
  break if Digest::MD5.hexdigest(key+number.to_s)[0..5] == "000000"
  number += 1
end

p "Found it: #{number}"
