require 'cell'
require 'pry'

class Board
  attr_reader :cell_hash

  def initialize
    @cell_hash = {}
    cells
  end

  def cells
    coordinates = ["A1","A2","A3","A4","B1" ,"B2","B3","B4" ,"C1","C2","C3","C4","D1","D2","D3","D4"]

    coordinates.each do |coordinate|
      @cell_hash[coordinate] = Cell.new(coordinate)
    end
    @cell_hash
  end

  def valid_coordinate?(coordinate)
    return true if @cell_hash.keys.include?(coordinate)
    false
  end

  def place(ship, coordinates)

  # cell.ship = nil,
  #need to add ship name to cell object that
  #matches coordinates with given coodinate values


  end

end
