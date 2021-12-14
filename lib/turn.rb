require "./lib/board"
require "./lib/ship"
require "./lib/player"
require "./lib/computer_player"

class Turn

  def display_boards(computer_board, player_board)
    puts "=============COMPUTER BOARD============="
    puts computer_board
    puts "==============PLAYER BOARD=============="
    puts player_board
  end
end
