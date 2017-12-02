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
