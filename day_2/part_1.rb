# The spreadsheet consists of rows of apparently-random numbers. To make sure the recovery process is on the right track, they need you to calculate the spreadsheet's checksum. For each row, determine the difference between the largest value and the smallest value; the checksum is the sum of all of these differences.

# For example, given the following spreadsheet:

# 5 1 9 5
# 7 5 3
# 2 4 6 8
# The first row's largest and smallest values are 9 and 1, and their difference is 8.
# The second row's largest and smallest values are 7 and 3, and their difference is 4.
# The third row's difference is 6.
# In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.


spreadsheet_lines = File.open(File.dirname(__FILE__) + '/input.txt').read

total_sum = 0

spreadsheet_lines.each_line do |line|
  line_arr = line.split(' ')
  line_arr = line_arr.map(&:to_i)      # convert str array to int array
  line_smallest = line_arr.min.to_i    # cheap route :/
  line_largest = line_arr.max.to_i     # cheap route :/

  total_sum += line_largest - line_smallest
end

puts total_sum
