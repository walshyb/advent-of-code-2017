class Tree
  attr_accessor :root
  attr_reader :tower

  def initialize
    @tower = {}
    @all_programs = []
    @all_sub_towers = []
    @input = File.open(File.dirname(__FILE__) + '/input.txt').read

    generate_tower
  end

  # Finds the root of the tree
  #
  # @return [String] - the name of the program at the root
  def find_root
    @all_programs - @all_sub_towers
  end

  # Generate the tower of all programs and sub towers
  def generate_tower
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

      # Track each program's weight and sub towers
      @tower[program] = {weight: weight, sub_towers: sub_towers}
    end
  end
end

class Node
  attr_accessor :program, :weight
end

tree = Tree.new
puts tree.tower

