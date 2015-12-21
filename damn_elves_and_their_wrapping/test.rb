require_relative 'lib/gift_wrapper'

total_wrapping = 0
total_ribbon = 0

File.new('input.txt').each do |line|
  clean_line = line.delete('\n')
  parser = GiftWrapper.new(clean_line)
  total_wrapping += parser.square_foot
  total_ribbon += parser.total_ribbon_length
end

p "Total wrapping: #{total_wrapping}"
p "Total ribbon: #{total_ribbon}"
