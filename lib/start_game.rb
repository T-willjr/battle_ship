require './lib/board'

class StartGame
  def initialize
      @computer = ComputerPlayer.new
      @player = Player.new
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    main_menu_input = gets.chomp.upcase
    main_menu_options(main_menu_input)
  end

  def main_menu_options(user_input)
    case user_input
    when "P"
      @computer.computer_setup
      @player.player_setup
    when "Q"
      exit
    end
  end
end
