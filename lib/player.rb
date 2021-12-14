require "./lib/board"
class Player

  def initialize
    @player_board = Board.new
  end

  def player_setup
    puts "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render
    cruiser_placement
  end

  def cruiser_placement
    print "Enter the squares for the Cruiser (3 spaces):\n>"
    cruiser_imput = gets.chomp
  end
end

player = Player.new
player.player_setup
