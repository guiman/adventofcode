require 'digest'
require 'java'

# 'java_import' is used to import java classes
java_import 'java.util.concurrent.Callable'
java_import 'java.util.concurrent.FutureTask'
java_import 'java.util.concurrent.LinkedBlockingQueue'
java_import 'java.util.concurrent.ThreadPoolExecutor'
java_import 'java.util.concurrent.TimeUnit'

number = 0
block_size = 100_000
solution = -1
template = '%{key}%{number}'
THREAD_COUNT = 4
executor = ThreadPoolExecutor.new(4, # core_pool_treads
                                  4, # max_pool_threads
                                  60, # keep_alive_time
                                  TimeUnit::SECONDS,
                                  LinkedBlockingQueue.new)

class SingleCalculator
  include Callable
  attr_reader :number, :block_size, :key, :index, :template

  def initialize(number, block_size, key, index)
    @number = number
    @block_size = block_size
    @key = key
    @index = index
    @result = nil
    @template = '%{key}%{number}'
  end

  def call
    start = number + (block_size * index)
    finish = start + block_size
    (start..finish).to_a.each do |current|
      test = template % { number: current, key: key }
      data = Digest::MD5.hexdigest(test).to_s
      if data[0..5] == "000000"
        @result = current
        break
      end
    end
    @result
  end
end


potential_results = []
loop do
  tasks = []

  THREAD_COUNT.times do |i|
    task = FutureTask.new(SingleCalculator.new(number, block_size, ARGV[0], i))
    executor.execute(task)
    tasks << task
  end

  tasks.each do |t|
    result = t.get
    potential_results << result if result
  end

  if potential_results.any?
    solution = potential_results.min
    break
  else
    number += (block_size * THREAD_COUNT)
  end
end

p "Found it: #{solution}"
