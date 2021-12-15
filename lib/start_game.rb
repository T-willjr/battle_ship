require './lib/board'
require './lib/computer_player'
require './lib/player'
require "./lib/ship"

class StartGame
  def initialize
      @computer = ComputerPlayer.new
      @player = Player.new
      @coordinates = ["A1","A2","A3","A4","B1","B2","B3","B4" ,"C1","C2","C3","C4","D1","D2","D3","D4"]
      @comp_coordinates = ["A1","A2","A3","A4","B1","B2","B3","B4" ,"C1","C2","C3","C4","D1","D2","D3","D4"]
      @coordinates_fired_on = []
      @computer_input = nil
      @player_sunken_ships = 0
      @computer_sunken_ships = 0
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
    start_turn(@computer.computer_board, @player.player_board)
    main_menu
  end

  def start_turn(computer_board, player_board)
    puts "=============COMPUTER BOARD============="
    puts computer_board.render
    puts "==============PLAYER BOARD=============="
    puts player_board.render
    print "Enter the coordinate for your shot:\n>"
    shot_input
  end

  def shot_input
    player_shot_input = gets.chomp.upcase.strip
    check_player_shot(player_shot_input)
    player_shoots(@computer.computer_board,@player.player_board,player_shot_input)
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
    shot_input
  end

  def invalid_input
    print "Please enter a valid coordinate:\n>"
    shot_input
  end

  def player_shoots(computer_board,player_board,player_input)
    computer_shoots(player_board)
    computer_board.cells[player_input].fire_upon
    show_results_player(computer_board,player_input)
    results(computer_board,player_board,player_input)
  end

  def computer_shoots(player_board)
    @computer_input = @comp_coordinates.sample
    player_board.cells[@computer_input].fire_upon
    @comp_coordinates.delete(@computer_input)
  end

  def results(computer_board,player_board,player_input)
    puts "Your shot on #{player_input} was a #{show_results_player(computer_board,player_input)}"
    puts "My shot on #{@computer_input} was a #{show_results_computer(player_board)} "
    start_end(computer_board,player_board)
  end

  def start_end(computer_board,player_board)
    if @player_sunken_ships == 4
      puts "I won!"
      @player.player_board = Board.new
      @computer.computer_board = Board.new
    elsif @computer_sunken_ships == 4
      puts "You won!"
    else
      start_turn(computer_board,player_board)
    end
  end

  def show_results_player(computer_board,player_input)
    comp_cells = computer_board.cells[player_input]
    if comp_cells.fired_at_cell == true && comp_cells.empty? == true
      "Miss"
    elsif comp_cells.fired_at_cell == true && comp_cells.empty? == false && comp_cells.ship.health > 0
      "Hit"
    elsif comp_cells.fired_at_cell == true && comp_cells.empty? == false && comp_cells.ship.health == 0
      @computer_sunken_ships +=1
      "hit to sink the ship"
    end
  end

  def show_results_computer(player_board)
    player_cells = player_board.cells[@computer_input]

    if player_cells.fired_at_cell == true && player_cells.empty? == true
      "Miss"
    elsif player_cells.fired_at_cell == true && player_cells.empty? == false && player_cells.ship.health > 0
      "Hit"
    elsif player_cells.fired_at_cell == true && player_cells.empty? == false && player_cells.ship.health == 0
      @player_sunken_ships +=1
      "hit to sink the ship"
    end
  end


end
