class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_at_cell = false
  end

  def empty?
    return true if @ship == nil
    false
  end

  def place_ship(ship_type)
    @ship = ship_type
  end

  def fired_upon?
    return false if @fired_at_cell == false
    true
    # ship.hit == true

  end

  def fire_upon

    if @ship == nil
      @fired_at_cell = true
    else
      @ship.hit
      @fired_at_cell = true
    end
  end

  def render
    if fired_upon? == false
      "."
    elsif fired_upon? == true && empty? == true
      "M"
    elsif fired_upon? == true && empty? == false && ship.health > 0
      "H"
    elsif fired_upon? == true && empty? == false && ship.health = 0
      "X"


    end
  end

end
