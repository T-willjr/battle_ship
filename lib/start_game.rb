require './lib/board'

class StartGame

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    main_menu_input = gets.chomp.upcase
    main_menu_options(main_menu_input)
  end
end
