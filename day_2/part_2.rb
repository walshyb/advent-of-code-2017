# the goal is to find the only two numbers in each row where one evenly divides the other - that is, where the result of the division operation is a whole number. They would like you to find those numbers on each line, divide them, and add up each line's result.

# For example, given the following spreadsheet:

# 5 9 2 8
# 9 4 7 3
# 3 8 6 5
# In the first row, the only two numbers that evenly divide are 8 and 2; the result of this division is 4.
# In the second row, the two numbers are 9 and 3; the result is 3.
# In the third row, the result is 2.
# In this example, the sum of the results would be 4 + 3 + 2 = 9.


spreadsheet_lines = File.open(File.dirname(__FILE__) + '/input.txt').read
total_sum = 0

# Looks for two numbers that when divided make a whole number
# @param line [Array] a row from the input file
# @return [Float] the whole number (the quotient)
def find_whole_number(line)
  line.each_with_index do |num1, i|
    line.each_with_index do |num2, i|
      if num1 != num2
        quotient = num1 / num2 

        # if quotient is a whole number and not zero
        if (quotient == quotient.to_i) && quotient != 0
          return quotient
        end
      end
    end
  end
end

spreadsheet_lines.each_line do |line|
  line_arr = line.split(' ')
  line_arr = line_arr.map(&:to_f)      # convert str array to int array

  quotient = find_whole_number(line_arr)
  total_sum += quotient
end

puts total_sum
