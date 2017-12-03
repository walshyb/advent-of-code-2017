class Board
  attr_reader :board, :starting_row, :starting_column, :finishing_column, :finishing_row

  def initialize(size)
    @max_num = size

    # create a 2D array with 600 rows and columns
    # I picked 600 because it's a round number
    # greater than the square root of the input square (289326)
    #@board = Array.new(600) { Array.new(600, 0) }
    
    size = Math.sqrt(size).ceil                       # take square root
    size = (size + 100) / 100 * 100                   # round to nearest 100

    @board = Array.new(size) { Array.new(size, 0) }   # generate 2D array

    # index 300 for the row and column
    # because it's the middle of the board
    #start_pos = 300
    
    start_pos = size / 2                              # start in center of board

    @board[start_pos][start_pos] = 1

    @current_row = @starting_row = @starting_column = start_pos
    @current_column = start_pos + 1
  end

  def generate_board
    for i in 2..@max_num
      @board[@current_row][@current_column] = i

      if i == @max_num                                # don't increment row & col if we're at the end
        break
      else
        move_square
      end
    end

    @finishing_row = @current_row                     # save finishing row and col
    @finishing_column = @current_column
  end

  def print_board
    board.each do |l|
      puts l.join(' ')
    end
  end

  private

  def move_square
    current_num = board[@current_row][@current_column]
    left_num = board[@current_row][@current_column - 1]
    right_num = board[@current_row][@current_column + 1]
    up_num = board[@current_row - 1][@current_column]
    down_num = board[@current_row + 1][@current_column]

    #puts "Current Row: #{@current_row}" 
    #puts "Crrent col: #{@current_column}"
    #puts "Curret num: #{current_num}"

    #puts "Left: #{left_num}"
    #puts "Right: #{right_num}"
    #puts "Up: #{up_num}"
    #puts "Down: #{down_num}"

    #puts "###############"

    if left_num > 0 && right_num == 0 && up_num == 0
      move_up
    elsif left_num == 0 && down_num > 0
      move_left
    elsif left_num == 0 && right_num > 0 && down_num == 0
      move_down
    elsif up_num > 0 && right_num == 0
      move_right
    else
      puts 'fail'
    end
  end

  def move_up
    #puts 'up'
    @current_row -= 1
  end

  def move_left
    #puts 'left'
    @current_column -= 1
  end

  def move_down
    #puts 'down'
    @current_row += 1
  end

  def move_right
    #puts 'right'
    @current_column += 1
  end
end
