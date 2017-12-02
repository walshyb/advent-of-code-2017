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
