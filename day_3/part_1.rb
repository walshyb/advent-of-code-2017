require './board'

board = Board.new(1024)
board.generate_board

#board.print_board

sr = board.starting_row
sc = board.starting_column

fr = board.finishing_row
fc = board.finishing_column

# Manhattan Distance Algorithm
# |a - c| + |b - d|
op1 = (sr-fr).abs
op2 = (sc-fc).abs
result = op1 + op2

puts "Num 1: #{board.board[sr][sc]}"
puts "Num 2: #{board.board[fr][fc]}"
puts "The distance is |#{sr} - #{fr}| + |#{sc} - #{fc}| = #{result}"
