
def print_board board

   puts "#{board[0][0]} | #{board[0][1]} | #{board[0][2]}"
   puts "__________"
   puts "#{board[1][0]} | #{board[1][1]} | #{board[1][2]}"
   puts "__________"
   puts "#{board[2][0]} | #{board[2][1]} | #{board[2][2]}"

end

def take_turn turn, board
  
  puts "Tell me where #{turn}s should play"
  print "row (0, 1 or 2) > "
  row = gets.to_i
  print "column (0, 1 or 2) > "
  column = gets.to_i
  
  if board[row][column] != " "
    puts "That poistion is taken by #{board[row][column]}s, please try again"
    take_turn turn, board
  else
    board[row][column] = turn
  end
end


board = [ [" "," "," "],
          [" "," "," "],
          [" "," "," "] ]
          
print_board board          
          
take_turn "o",board

print_board board
take_turn "x",board
print_board board
