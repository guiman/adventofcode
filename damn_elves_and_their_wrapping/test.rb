require_relative 'lib/gift_wrapper'

total = 0

File.new('input.txt').each do |line|
  clean_line = line.delete('\n')
  parser = GiftWrapper.new(clean_line)
  p parser.input_to_array
  total += parser.square_foot
end

p "Total: #{total}"
