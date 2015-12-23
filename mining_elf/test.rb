require 'thread'
require 'digest'

key = ARGV[0]
mutex = Mutex.new
threads = []
solution = -1
condition = "000000"

threads << Thread.new do
  curr = 0
  while solution < 0 do
    if Digest::MD5.hexdigest(key+curr.to_s)[0..5] == condition
      mutex.synchronize { solution = curr }
    else
      curr += 2
    end
  end
end

threads << Thread.new do
  curr = 1
  while solution < 0 do
    if Digest::MD5.hexdigest(key+curr.to_s)[0..5] == condition
      mutex.synchronize { solution = curr }
    else
      curr += 2
    end
  end
end

threads.each { |t| t.join }

p "Found it: #{solution}"
