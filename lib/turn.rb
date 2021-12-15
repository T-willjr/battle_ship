require "./lib/board"
require "./lib/ship"
require "./lib/player"
require "./lib/computer_player"

class Turn

  def initialize
    @coordinates = ["A1","A2","A3","A4","B1","B2","B3","B4" ,"C1","C2","C3","C4","D1","D2","D3","D4"]
    @comp_coordinates = ["A1","A2","A3","A4","B1","B2","B3","B4" ,"C1","C2","C3","C4","D1","D2","D3","D4"]
    @coordinates_fired_on = []
    @computer_input = nil
  end

  def start_turn(computer_board, player_board)
    puts "=============COMPUTER BOARD============="
    puts computer_board.render
    puts "==============PLAYER BOARD=============="
    puts player_board.render
    player_shot_turn(computer_board,player_board)
  end

  def player_shot_turn(computer_board,player_board)
    print "Enter the coordinate for your shot:\n>"
    player_shot_input = gets.chomp.upcase.strip
    check_player_shot(player_shot_input)
    player_shoots(computer_board,player_board,player_shot_input)
  end

  def computer_shoots(player_board)
    @computer_input = @comp_coordinates.sample
    player_board.cells[@computer_input].fire_upon
    @comp_coordinates.delete(@computer_input)
  end

  def player_shoots(computer_board,player_board,player_input)
    computer_shoots(player_board)
    computer_board.cells[player_input].fire_upon
    results(computer_board,player_board,player_input)
  end

  def check_player_shot(player_input)
      if @coordinates.include?(player_input) == true && @coordinates_fired_on.include?(player_input) == false
        @coordinates_fired_on << player_input
      elsif @coordinates_fired_on.include?(player_input) == true
        fired_on_already
      else
        invalid_input
      end
  end

  def fired_on_already
    print "You have already fired on this coordinate. Please enter a valid coordinate:\n>"
    try_again_input = gets.chomp.upcase.strip
    check_player_shot(try_again_input)
  end

  def invalid_input
    print "Please enter a valid coordinate:\n>"
    re_enter_input = gets.chomp.upcase.strip
    binding.pry
    check_player_shot(re_enter_input)
  end

  def results(computer_board,player_board,player_input)
    puts "Your shot on #{player_input} was a #{"Test"}"
    puts "My shot on #{@computer_input} was a #{"miss"} "
    start_turn(computer_board,player_board)
  end
end
