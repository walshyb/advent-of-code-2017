@input  = File.open(File.dirname(__FILE__) + '/input.txt').read

@towers = {}
@all_programs = []
@all_sub_towers = []

def create_towers
  @input.each_line do |line|
    weight = line.match(/(\((.*)\))/)[2]
    program = line.split(' ').first

    # If current program has sub towers
    if line.include? '>'
      sub_towers = line.split('> ').last.split(', ')
    end

    # Add progarm to list of programs
    @all_programs << program

    # If current program has sub towers,
    # add each one to the list of all sub towers.
    if sub_towers
      sub_towers.each do |s|
        @all_sub_towers << s.gsub("\n", '')
      end
    end

    # Track each program's weight and value
    @towers[program] = {weight: weight, sub_towers: sub_towers}
  end
end

# Find root of tree.
# The root of the tree is a program (aka a node)
# that isn't in another program's sub tower.
def find_root
  # Take the difference of the sets to find the 
  # program that isn't a sub tower of any other.
  root = @all_programs - @all_sub_towers
  return root
end

create_towers
puts find_root
