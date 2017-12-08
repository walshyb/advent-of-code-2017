input  = File.open(File.dirname(__FILE__) + '/input.txt').read
banks = input.split(' ')                    # store input into string array
banks = banks.map(&:to_i)                   # convert string array to int array


number_of_redistributions = 0
states = []                                 # create array to store states
states.push banks.dup                       # store initial state

# for the number of banks
while true
  starting_index = banks.find_index(banks.max)  # get index of max bank
  blocks_to_distribute = num_of_blocks = banks[starting_index]
  banks[starting_index] = 0                 # reset bank at current index
  index = starting_index + 1                # start at next index

  for j in 0..num_of_blocks-1               # for the number of blocks in the max bank
    index = index % banks.length            # handle wrapping of array

    banks[index] += 1                       # increase block at current bank
    blocks_to_distribute -= 1               # decrease the number of blocks left to distribute
    index += 1                              # go to next index
  end

  number_of_redistributions += 1            # increment number of redistributions
  if states.include? banks                  # if this state was already reached
    break                                   # break loop
  else
    states.push banks.dup                   # save current state
  end
end

puts number_of_redistributions
