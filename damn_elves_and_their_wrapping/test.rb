require_relative 'lib/wrapping_paper'

total = 0

File.new('input.txt').each do |line|
  clean_line = line.delete('\n')
  parser = WrappingPaper.new(clean_line)
  p parser.input_to_array
  total += parser.square_foot
end

p "Total: #{total}"
