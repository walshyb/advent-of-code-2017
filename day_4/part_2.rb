lines = File.open(File.dirname(__FILE__) + '/input.txt').read

number_of_valid_lines = 0

defdd

# Return true if line is valid
# False otherwise
def check_validity(line)
end


lines.each_line do |l|
  line = l.split(' ')

  is_valid = check_validity(line)
  number_of_valid_lines += 1 if is_valid
end

puts number_of_valid_lines

private

def check_duplicate(line)
end

def check_anagram(line)
end