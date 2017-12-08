input  = File.open(File.dirname(__FILE__) + '/input.txt').read
banks = input.split(' ')                    # store input into string array
banks = banks.map(&:to_i)                   # convert string array to int array


number_of_redistributions = 0
states = {}                                 # create hash to state occurrences 

# run forever, until we find a cycle that was previously produced
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

  banks_key = banks.to_s                    # convert array to string
                                            # this be used as a key in a hash

  if states[banks_key]                      # if key already exists (if bank was also created)

    if states[banks_key][:occurrences] == 2 # break there around 2 occurrences
      puts states[banks_key][:index]        # display result
      break
    end

    # update number of occurrences and 
    # subtract current number of redistributions with the last
    # redistribution number (index) to calculate how many
    # redistributions occurred since the last match
    states[banks_key] = {
      index: number_of_redistributions - states[banks_key][:index],
      occurrences: states[banks_key][:occurrences] + 1
    }

  else
    # use the stringified array as the key
    # with the value as the redistribution number it was found at
    states[banks_key] = {
      index: number_of_redistributions,
      occurrences: 1
    }
  end

  number_of_redistributions += 1            # increment number of redistributions
end
