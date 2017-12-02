# Instead of considering the next digit, it wants you to consider the digit halfway around the circular list. That is, if your list contains 10 items, only include a digit in your sum if the digit 10/2 = 5 steps forward matches it. Fortunately, your list has an even number of elements.

# For example:

# 1212 produces 6: the list contains 4 items, and all four digits match the digit 2 items ahead.
# 1221 produces 0, because every comparison is between a 1 and a 2.
# 123425 produces 4, because both 2s match each other, but no other digit has a match.
# 123123 produces 12.
# 12131415 produces 4.


# read input string from text file
input_string = File.read(File.dirname(__FILE__) + '/input.txt')

# keeps track of how many digits there are
input_count = input_string.length

# number of steps forward to match
steps_forward = input_count / 2

# concatenate the input string to the end of itself
# to make it easier to account match n number of digits ahead
# without having to wrap around back to the beginning
input_string += input_string

input_arr = input_string.split('')

total_sum = 0

input_arr.each_with_index do |num, i|

  # if we're at the last digit of the original input string
  if i == input_count
    break
  else 
    if num == input_arr[i + steps_forward]
      total_sum += num.to_i
    end
  end
end

puts total_sum
