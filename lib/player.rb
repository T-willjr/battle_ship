require "./lib/board"
require "./lib/ship"
class Player

  def initialize
    @player_board = Board.new
  end

  def game_explanation
    puts " I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long."
  end

  def player_setup
    game_explanation
    puts @player_board.render
    print "Enter the squares for the Cruiser (3 spaces):\n>"
    cruiser_placement
  end

  def cruiser_placement
    cruiser_input = gets.chomp.split
    check_cruiser_coordinates(cruiser_input)
  end

  def check_cruiser_coordinates(cruiser_input)
    cruiser = Ship.new("Cruiser", 3)
    if @player_board.valid_placement?(cruiser, cruiser_input)
      @player_board.place(cruiser, cruiser_input)
      puts @player_board.render(true)
      submarine_placement
    else
      puts "Those are invalid coordinates. Please try again:"
      cruiser_placement
    end
  end

  def submarine_placement
    submarine = Ship.new("Submarine", 2)
    print "Enter the squares for the Submarine (2 spaces):>"
    sub_input = gets.chomp.split
    check_sub_coordinates(submarine, sub_input)
  end

  def check_sub_coordinates(sub,sub_input)
    if @player_board.valid_placement?(sub, sub_input)
      @player_board.place(sub, sub_input)
      puts @player_board.render(true)
    else
      puts "Those are invalid coordinates. Please try again:"
      submarine_placement
    end
  end


end

player = Player.new
player.player_setup
