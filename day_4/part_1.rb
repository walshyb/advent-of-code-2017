lines = File.open(File.dirname(__FILE__) + '/input.txt').read

number_of_valid_lines = 0

lines.each_line do |l|
  line = l.split(' ')

  number_of_valid_lines += 1 if line.uniq.length == line.length
end

puts number_of_valid_lines