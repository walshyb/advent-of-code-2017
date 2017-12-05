lines = File.open(File.dirname(__FILE__) + '/input.txt').read
offsets = lines.split("\n")
offsets = offsets.map(&:to_i)

number_of_steps = 0

index = 0
while offsets[index] != nil         # while not out of bounds
  current_offset = offsets[index]   # save current number (the offset)

  if current_offset >= 3            # if offset is 3 or more
    offsets[index] -= 1             # decrement number at current index
  else
    offsets[index] += 1             # increment number at current index
  end

  index = current_offset + index    # jump to next index based on offset
  number_of_steps += 1              # increment step counter
end

puts number_of_steps
