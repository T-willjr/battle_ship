class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = []
  end

  def empty?
    return false if @ship.size > 0
    true
  end

  def place_ship(ship_type)
    @ship << ship_type

  end
end
