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
    if valid_letter_order?(coordinates) == false && valid_number_order?(coordinates) == false || valid_ship_length?(ship, coordinates) == false  || valid_letter_order?(coordinates) == true && valid_number_order?(coordinates) == true
      false
    else
      true
    end
  end

  def valid_ship_length?(ship, coordinates)
    ship.length == coordinates.length
  end

  def valid_letter_order?(coordinate)
    letters = coordinate.map { |coordinate| coordinate.scan(/\D+/).first }
    let_ord = letters.each_cons(2).all? { |a, b| b.ord == a.ord + 1 }
  end

  def valid_number_order?(coordinate)
    nums = coordinate.map { |coordinate| coordinate.scan(/\d+/).first.to_i }
    num_ord = nums.each_cons(2).all? { |a, b| b == a + 1 }
  end
end


#row_a, row_b, row_c, row_d = @cell_hash.cons(4) { |key,value| "value.render }

# If let_ord is true it goes from A -> B -> C
# If num_ord is true it goes from 1 -> 2 -> 3

# If let_ord is false letters not alphabetical
# If num_ord is false numbers not in order
# ["A1", "B2", "C3"] = false then let_ord && num_ord is true
# ["A1", "A2", "A4"] = false then num_ord is false
