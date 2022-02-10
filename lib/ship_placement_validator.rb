class ShipPlacementValidator
  attr_reader :coordinates, :ship

  def initialize(ship, coordinates, cell_hash)
    @ship = ship
    @coordinates = coordinates
    @cell_hash = cell_hash
  end

  def self.valid?(ship, coordinates, cell_hash)
    new(ship, coordinates, cell_hash).valid?
  end

  def valid?
    is_not_diagonal? && valid_ship_length? && valid_order? && no_ship_overlap?
  end

  private

  def valid_order?
    valid_letter_order? || valid_number_order?
  end

  def is_not_diagonal?
    !(valid_letter_order? && valid_number_order?)
  end

  def valid_number_order?
    nums = coordinates.map { |coordinate| coordinate.scan(/\d+/).first.to_i }
    num_ord = nums.each_cons(2).all? { |a, b| b == a + 1 }
  end

  def valid_letter_order?
    letters = coordinates.map { |coordinate| coordinate.scan(/\D+/).first }
    let_ord = letters.each_cons(2).all? { |a, b| b.ord == a.ord + 1 }
  end

  def valid_ship_length?
    ship.length == coordinates.length
  end

  def no_ship_overlap?
    !(coordinates.any? { |cord| @cell_hash[cord].empty? == false })
  end
end
