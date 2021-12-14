require "./lib/board"
require "./lib/ship"
class Player

  def initialize
    @player_board = Board.new
  end

  def game_explaination
    puts "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long."
  end

  def player_setup
    game_explaination
    puts @player_board.render
    print "Enter the squares for the Cruiser (3 spaces):\n>"
    cruiser_input = gets.chomp.split
    cruiser_placement(cruiser_input)
  end

  def cruiser_placement(cruiser_input)
    cruiser = Ship.new("Cruiser", 3)
    @player_board.place(cruiser, cruiser_input)
    puts @player_board.render(true)
  end
end

player = Player.new
player.player_setup
