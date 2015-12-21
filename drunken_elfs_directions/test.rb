$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'santa_house_counter'

input = File.open('input.txt').read
clean_input = input.gsub(/\n/, '')

houses_visited = SantaHouseCounter.new(clean_input).count_houses
houses_visited_with_robot = SantaHouseCounter.new(clean_input).count_houses_with_robot

p "Total houses: #{houses_visited}"
p "Total houses with robot: #{houses_visited_with_robot}"
