class Decoration
  include GM::D
  attr_accessor :orientation

  def orientation
    @orientation || :vertical
  end

  def vertical?
    orientation == :vertical
  end

  def horizontal?
    orientation == :horizontal
  end

  def top
    @is_top = true
    self
  end
  def top?
    @is_top
  end

  def bottom
    @is_top = false
    self
  end
  def bottom?
    !@is_top
  end

  def direction
    bottom? ? 1 : -1
  end

  def context
    UIGraphicsGetCurrentContext()
  end

end


class Ground < Decoration

  def draw_at(x, y)
    t = Path.new(x, y)
      .delta(0, direction * 7)
      .delta_move(-7, 0)
      .delta(14, 0)
      .delta_move(-11, direction * 3)
      .delta(8, 0)
      .delta_move(-5, direction * 3)
      .delta(2, 0)
      .stroke(:black)
      .line_width(0.5)
    t.draw
  end

end

class Vdd < Decoration

  def draw_at(x, y)
    r = 5.0
    m = 2.0
    d = r - m
    t = Path.new(x, y)
      .delta(0, direction * 6)
      .arc_delta([0, direction * r], angle: 2.pi)
      .delta_move([0, direction * m])
      .delta([0, direction * 2 * d])
      .delta_move([-d, -direction * d])
      .delta([2 * d, 0])
      .stroke(:black)
      .line_width(0.5)
    t.draw
  end

end

class Vss < Decoration

  def draw_at(x, y)
    r = 5.0
    m = 2.0
    d = r - m
    t = Path.new(x, y)
      .delta(0, direction * 6)
      .arc_delta([0, direction * r], angle: 2.pi)
      .stroke(:black)
      .line_width(0.5)
    if vertical?
      t.delta_move([0, direction * m])
      t.delta([0, direction * d * 2])
    else
      t.delta_move([-d, direction * r])
      t.delta([d * 2, 0])
    end
    t.draw
  end

end
