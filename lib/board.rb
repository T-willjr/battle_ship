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
    @cell_hash.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)

    letters = coordinates.map { |coordinate| coordinate.scan(/\D+/).first }
    a_ord = letters.each_cons(2).all? { |a, b| b.ord == a.ord + 1 }

    nums = coordinates.map { |coordinate| coordinate.scan(/\d+/).first.to_i }
    num_ord = nums.each_cons(2).all? { |a, b| b == a + 1 }

    return false if a_ord == true && num_ord == true
    true

    #ship.length == coordinates.length ***Test 1***
  end

end
