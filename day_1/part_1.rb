# Review a sequence of digits (your puzzle input) and find the sum of all digits that match the next digit in the list. The list is circular, so the digit after the last digit is the first digit in the list.

# For example:

# 1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
# 1111 produces 4 because each digit (all 1) matches the next.
# 1234 produces 0 because no digit matches the next.
# 91212129 produces 9 because the only digit that matches the next one is the last digit, 9.


# read input string from text file
input_string = File.read(File.dirname(__FILE__) + '/input.txt')

input_arr = input_string.split('')
total_sum = 0

input_arr.each_with_index do |num, index|
  next_num  = input_string[index + 1]

  # if there's another int
  if next_num
    # if current num matches the next
    if num == next_num

      # convert string num to int num
      num_as_int = num.to_i

      # add it to the total
      total_sum += num_as_int
    end
  # if last digit
  else

    # if last number matches the first
    if num == input_arr[0]
      # add it to the total
      total_sum += input_arr[0].to_i
    end
  end
end

puts total_sum
