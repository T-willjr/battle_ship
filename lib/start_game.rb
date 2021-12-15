require './lib/board'
require './lib/computer_player'
require './lib/player'
require './lib/turn'

class StartGame
  def initialize
      @computer = ComputerPlayer.new
      @player = Player.new
      @turn = Turn.new
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    main_menu_input = gets.chomp.upcase.strip
    main_menu_options(main_menu_input)
  end

  def main_menu_options(user_input)
    case user_input
    when "P"
      play_game
    when "Q"
      exit!
    end
  end

  def play_game
    @computer.computer_setup
    @player.player_setup
    turn
  end

  def turn
    @turn.start_turn(@computer.computer_board, @player.player_board)
  end
end
