require 'pry'
require 'cell'
class Board
  attr_reader :cell_hash

  def initialize
    @cell_hash = {}
    make_cells
  end

  def cells
    @cell_hash
  end

  def make_cells
    coordinates = ["A1","A2","A3","A4","B1" ,"B2","B3","B4" ,"C1","C2","C3","C4","D1","D2","D3","D4"]

    coordinates.each do |coordinate|
      @cell_hash[coordinate] = Cell.new(coordinate)
    end

  end

  def valid_coordinate?(coordinate)
    @cell_hash.keys.include?(coordinate)
  end

  def ship_overlap?(coordinates)
    coordinates.any? { |cord|
      @cell_hash[cord].empty? == false}

  end

  def valid_placement?(ship, coordinates)

    letters = coordinates.map { |coordinate| coordinate.scan(/\D+/).first }
    let_ord = letters.each_cons(2).all? { |a, b| b.ord == a.ord + 1 }

    nums = coordinates.map { |coordinate| coordinate.scan(/\d+/).first.to_i }
    num_ord = nums.each_cons(2).all? { |a, b| b == a + 1 }

    if let_ord == true && num_ord == true || ship.length != coordinates.length || num_ord == false && let_ord == false || ship_overlap?(coordinates) == true
      false
    else
      true
    end
  end
  # If let_ord is true it goes from A -> B -> C
  # If num_ord is true it goes from 1 -> 2 -> 3

  # If let_ord is false letters not alphabetical
  # If num_ord is false numbers not in order
  # ["A1", "B2", "C3"] = false then let_ord && num_ord is true
  # ["A1", "A2", "A4"] = false then num_ord is false

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates) == true
      coordinates.each do |cord|
        @cell_hash[cord].place_ship(ship)
      end

    end

  end
end
