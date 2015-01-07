# @requires GM::Drawler
class CMOS < UIView
  include GM::D
  attr_updates :attrs
  attr_updates :title
  attr_updates :pins
  attr_updates :pin_labels
  attr_updates :pin_colors

  PinWidth = 15.0
  PinHeight = 14.0
  PinMargin = 8.0
  PinFontSize = 7.0
  PinLabelSize = 9.0
  PinStrokeWidth = 3.0
  BoldStrokeWidth = 5.0
  ChipHeight = 60.0
  IndentRadius = 7.0

  def attrs
    @attrs ||= {
      'normal' => { NSFontAttributeName => :monospace.uifont(PinFontSize), NSStrokeWidthAttributeName => 3, },
      'bold' => { NSFontAttributeName => :monospace.uifont(PinFontSize), NSStrokeWidthAttributeName => 5, },
    }
  end

  def pin_labels=(value)
    if value.is_a?(NSArray)
      hash = {}
      value.each_with_index do |val, index|
        hash[index + 1] = val
      end
      @pin_labels = hash
    else
      @pin_labels = value
    end
    setNeedsDisplay
  end

  def pin_labels
    @pin_labels ||= {}
  end

  def pin_colors
    @pin_colors ||= {}
  end

  def pins
    @pins ||= 14
  end

  def groups
    @groups ||= []
  end

  def pin_x_at(index)
    if index >= pins
      index = pins * 2 - index - 1
    end
    total_pin_width = PinWidth + PinMargin
    chip_width = PinMargin + pins * total_pin_width
    center_x = self.width / 2
    chip_left = center_x - chip_width / 2
    chip_left + PinMargin + index * total_pin_width
  end

  def drawRect(rect)
    total_pin_width = PinWidth + PinMargin
    width = PinMargin + pins * total_pin_width
    height = PinHeight * 2 + ChipHeight

    center_x = self.width / 2
    center_y = self.height / 2

    chip_width = width
    chip_height = ChipHeight
    chip_top = center_y - chip_height / 2
    chip_bottom = chip_top + chip_height
    chip_left = center_x - chip_width / 2
    chip_right = chip_left + chip_width

    pin_r = 2.0
    pin_height = PinHeight - pin_r
    pin_width = PinWidth - pin_r * 2
    pins.times do |pin|
      p1 = pin + 1
      p2 = pins * 2 - pin
      pin_color1 = pin_colors[p1] || pin_colors[p1.to_s] || pin_colors[p1.to_s.to_sym]
      pin_color2 = pin_colors[p2] || pin_colors[p2.to_s] || pin_colors[p2.to_s.to_sym]
      p1_label = pin_labels[p1] || pin_labels[p1.to_s] || pin_labels[p1.to_s.to_sym]
      p2_label = pin_labels[p2] || pin_labels[p2.to_s] || pin_labels[p2.to_s.to_sym]

      pin_x = pin_x_at(pin)
      mid_pin_x = pin_x + PinWidth / 2 + pin_r / 2

      # bottom / left label
      Path.new(pin_x, chip_bottom)
        .delta(0, pin_height)
        .arc_delta([pin_r, 0], angle: -1.pi/2)
        .delta(pin_width, 0)
        .arc_delta([0, -pin_r], angle: -1.pi/2)
        .delta(0, -pin_height)
        .stroke(:black)
        .line_width(0.5)
        .fill(pin_color1 || :clear)
        .draw

      t = Text.new(pin + 1)
        .color(:black)
        .font(:monospace.uifont(PinFontSize))
      t.translate([mid_pin_x, chip_bottom + PinHeight / 2])
      t.rotate(-90.degrees)
      t.stroke_width(PinStrokeWidth).draw

      if p1_label
        if p1_label.is_a?(Decoration)
          p1_label.bottom.draw_at(mid_pin_x, chip_bottom + PinHeight)
        else
          Text.new(p1_label.formatted(attrs))
            .color(:black)
            .font(:monospace.uifont(PinFontSize))
            .translate([mid_pin_x, chip_bottom + PinHeight + 2])
            .halign(:right)
            .rotate(-90.degrees)
            .stroke_width(BoldStrokeWidth)
            .draw
        end
      end

      # top / right label
      Path.new(pin_x, chip_top)
        .delta(0, -pin_height)
        .arc_delta([pin_r, 0], angle: 1.pi/2)
        .delta(pin_width, 0)
        .arc_delta([0, pin_r], angle: 1.pi/2)
        .delta(0, pin_height)
        .stroke(:black)
        .line_width(0.5)
        .fill(pin_color2 || :clear)
        .draw

      t = Text.new(pin + 1)
        .color(:black)
        .font(:monospace.uifont(PinFontSize))
      t.text(p2)
      t.translate([mid_pin_x, chip_top - PinHeight / 2])
      t.rotate(-90.degrees)
      t.stroke_width(PinStrokeWidth).draw

      if p2_label
        if p2_label.is_a?(Decoration)
          p2_label.top.draw_at(mid_pin_x, chip_top - PinHeight)
        else
          Text.new(p2_label.formatted(attrs))
            .color(:black)
            .font(:monospace.uifont(PinFontSize))
            .translate([mid_pin_x, chip_top - PinHeight - 2])
            .halign(:left)
            .rotate(-90.degrees)
            .stroke_width(BoldStrokeWidth)
            .draw
        end
      end
    end

    Path.new(chip_left, chip_top)
      .delta(chip_width, 0)
      .delta(0, chip_height)
      .delta(-chip_width, 0)
      .delta(0, -chip_height / 2 + IndentRadius)
      .arc_delta([0, -IndentRadius], angle: -1.pi)
      .close
      .stroke(:black)
      .fill(:black.uicolor(0.2))
      .draw

    title = "CD4511"
    if title
      Text.new(title)
        .color(:black)
        .translate([chip_left - 10, center_y])
        .rotate(-0.5.pi)
        .font(:monospace.uifont(10))
        .stroke_width(BoldStrokeWidth)
        .draw
    end

    groups.each do |group|
      pin_a, pin_b = group
      pin_a -= 1
      pin_b -= 1

      if pin_a < pins
        pin_a, pin_b = [pin_a, pin_b].min, [pin_a, pin_b].max
        top = chip_bottom
        direction = 1
      else
        pin_b, pin_a = [pin_a, pin_b].min, [pin_a, pin_b].max
        top = chip_top
        direction = -1
      end
      top += direction * PinHeight

      pin_a_x = pin_x_at(pin_a)
      pin_b_x = pin_x_at(pin_b) + PinWidth
      pin_y1 = top + 18 * direction
      pin_y2 = top + 22 * direction

      Path.new(pin_a_x, pin_y1)
        .line(pin_a_x, pin_y2)
        .line(pin_b_x, pin_y2)
        .line(pin_b_x, pin_y1)
        .line_width(2)
        .stroke(:black)
        .draw
    end
  end

end


class Decoration
  include GM::D

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
    Path.new(x, y)
      .delta(0, direction * 7)
      .delta_move(-7, 0)
      .delta(14, 0)
      .delta_move(-11, direction * 3)
      .delta(8, 0)
      .delta_move(-5, direction * 3)
      .delta(2, 0)
      .stroke(:black)
      .line_width(0.5)
      .draw
  end

end

class Vdd < Decoration

  def draw_at(x, y)
    r = 5.0
    m = 2.0
    d = r - m
    Path.new(x, y)
      .delta(0, direction * 6)
      .arc_delta([0, direction * r], angle: 2.pi)
      .delta_move([0, m])
      .delta([0, direction * 2 * d])
      .delta_move([-direction * d, -direction * d])
      .delta([direction * 2 * d, 0])
      .stroke(:black)
      .line_width(0.5)
      .draw
  end

end