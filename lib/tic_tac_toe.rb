class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = [" ", " "," "," "," "," "," "," "," "]
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(num)
    modified_num = num.to_i
    return modified_num - 1
  end

  def move(index, ch)
    @board[index] = ch
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    if index < 0 || index > 8
      return false
    elsif position_taken?(index)
      return false
    else
      return true
    end
  end

  def turn_count()
    counter = 0
    @board.each do |val|
      if val != " "
        counter += 1
      end
    end
    counter
  end

  def current_player()
    counter = turn_count()
    if counter % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn();
    end
  end

  def won?()
    all_empty = @board.all? {|x| x == " "}
    if all_empty == true
      return false
  end

  def full?()
    !@board.any?{|i| i == " "}
  end

end
