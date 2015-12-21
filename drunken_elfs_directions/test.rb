$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'santa_house_counter'

input = File.open('input.txt').read
clean_input = input.gsub(/\n/, '')

houses_visited = SantaHouseCounter.new(clean_input).count_houses

p "Total houses: #{houses_visited}"
