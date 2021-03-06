# For added security, yet another system policy has been put in place. Now, a valid passphrase must contain no two words that are anagrams of each other - that is, a passphrase is invalid if any word's letters can be rearranged to form any other word in the passphrase.

# For example:

# abcde fghij is a valid passphrase.
# abcde xyz ecdab is not valid - the letters from the third word can be rearranged to form the first word.
# a ab abc abd abf abj is a valid passphrase, because all letters need to be used when forming another word.
# iiii oiii ooii oooi oooo is valid.
# oiii ioii iioi iiio is not valid - any of these words can be rearranged to form any other word.
# Under this new system policy, how many passphrases are valid?

# My result: 251


lines = File.open(File.dirname(__FILE__) + '/input.txt').read

number_of_valid_lines = 0

# Return true if line is valid
# False otherwise
def check_validity(line)
  return check_duplicate(line) && check_anagram(line)
end

# returns true if there are no duplicates
def check_duplicate(line)
  return line.uniq.length == line.length
end

# returns true if there are no other words
# in the list that can be rearranged to make a duplicate
def check_anagram(line)
  line.each_with_index do |i, index1|
    line.each_with_index do |j, index2|
      word1 = i.split('')                         # break up word1 into char array
      word2 = j.split('')                         # break up word2 into char array

      if index1 != index2                         # if the indicies aren't the same
        return false if word1.sort == word2.sort  # if the char arrays when sorted are the same, return false
      end
    end
  end

  return true
end

lines.each_line do |l|                            # go through each input line
  line = l.split(' ')                             # break up line into string array of words

  is_valid = check_validity(line)                 # check if it's valid
  number_of_valid_lines += 1 if is_valid          # increment if it's valid
end

puts number_of_valid_lines
