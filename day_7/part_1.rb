#pbga (66)
#xhth (57)
#ebii (61)
#havc (66)
#ktlj (57)
#fwft (72) -> ktlj, cntj, xhth
#qoyq (66)
#padx (45) -> pbga, havc, qoyq
#tknk (41) -> ugml, padx, fwft
#jptl (61)
#ugml (68) -> gyxo, ebii, jptl
#gyxo (61)
#cntj (57)


# The tree approach:

class Tree
  attr_accessor :root

  # go through input and find node that isn't a 
  # child of any other
  def find_root
  end
end

class Node
  attr_accessor :value, :weight
end



# The find root approach:
input  = File.open(File.dirname(__FILE__) + '/input.txt').read
@programs = []
@sub_programs = []

input.each_line do |line|
end


def find_programs
end

def find_sub_programs
end

# Go through programs and sub_programs arrays and find 
# node that isn't 
def find_root
end
