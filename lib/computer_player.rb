require './lib/cell'
require './lib/board'
require './lib/ship'


class ComputerPlayer
  attr_reader :computer_board

  def initialize
    @comp_cruis_choice = nil
    @comp_sub_choice = nil
    @computer_board = Board.new
  end

  def random_coordinates
      coordinates = ["A1","A2","A3","A4","B1" ,"B2","B3","B4" ,"C1","C2","C3","C4","D1","D2","D3","D4"]
      cruiser_cord = [["A1","A2","A3"], ["B1" ,"B2","B3"],["C1","C2","C3"]]
      submarine_cord = [["A4","B4"],["B4","C4"],["C4","D4"]]

      @comp_cruis_choice = cruiser_cord.sample
      @comp_sub_choice = submarine_cord.sample
    end

    def computer_setup
      random_coordinates
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      @computer_board.place(cruiser, @comp_cruis_choice)
      @computer_board.place(submarine, @comp_sub_choice)
    end

end
