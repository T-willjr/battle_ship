class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @hit = false
  end

  def empty?
    return true if @ship == nil
    false
  end

  def place_ship(ship_type)
    @ship = ship_type
  end

  def fired_upon?
    return false if @hit == false
    true 
  end

  def fire_upon
    @ship.hit
    @hit = true
  end

end
