# @requires GM::Drawler
class CMOS < UIView
  include GM::D
  attr_updates :orientation
  attr_updates :title
  attr_updates :filename
  attr_updates :desc
  attr_updates :attrs
  attr_updates :pins
  attr_updates :pin_labels
  attr_updates :pin_colors

  # sizing:
  attr_updates :pin_width
  attr_updates :pin_height
  attr_updates :pin_margin
  attr_updates :chip_width
  attr_updates :chip_color
  attr_updates :indent_radius

  PinWidth = 15.0
  PinHeight = 14.0
  PinMargin = 10.0
  PinFontSize = 7.0
  PinLabelSize = 9.0
  PinStrokeWidth = 3.0
  BoldStrokeWidth = 5.0
  ChipWidth = 70.0
  IndentRadius = 7.0

  def orientation
    @orientation || :vertical
  end

  def vertical?
    orientation == :vertical
  end

  def horizontal?
    orientation == :horizontal
  end

  def filename
    @filename || @title || (@desc && @desc.gsub(' ', '_').downcase) || 'no_name'
  end

  def pin_width
    @pin_width || PinWidth
  end

  def pin_height
    @pin_height || PinHeight
  end

  def pin_margin
    @pin_margin || PinMargin
  end

  private def total_pin_width
    pin_width + pin_margin
  end

  def chip_height
    pin_margin + half_pins * total_pin_width
  end

  def chip_width
    @chip_width || ChipWidth
  end

  def chip_color
    @chip_color || :black.uicolor(0.2)
  end

  def indent_radius
    @indent_radius || IndentRadius
  end

  def attrs(size=nil)
    size ||= PinFontSize
    {
      'normal' => { NSFontAttributeName => :monospace.uifont(size), NSStrokeWidthAttributeName => 3, },
      'bold' => { NSFontAttributeName => :monospace.uifont(size), NSStrokeWidthAttributeName => 5, },
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

  def half_pins
    pins / 2
  end

  def groups
    @groups ||= []
  end

  def pin_x_at(index)
    if index >= half_pins
      index = pins - index - 1
    end
    center_x = self.width / 2
    chip_left = center_x - chip_height / 2
    chip_left + pin_margin + index * total_pin_width
  end

  def drawRect(rect)
    center_x = self.width / 2
    center_y = self.height / 2

    chip_top = center_y - chip_width / 2
    chip_bottom = chip_top + chip_width
    chip_left = center_x - chip_height / 2
    chip_right = chip_left + chip_height

    pin_r = 2.0
    inner_pin_height = pin_height - pin_r
    inner_pin_width = pin_width - pin_r * 2
    half_pins.times do |pin|
      p1 = pin + 1
      p2 = pins - pin
      pin_color1 = pin_colors[p1] || pin_colors[p1.to_s] || pin_colors[p1.to_s.to_sym]
      pin_color2 = pin_colors[p2] || pin_colors[p2.to_s] || pin_colors[p2.to_s.to_sym]
      p1_label = pin_labels[p1] || pin_labels[p1.to_s] || pin_labels[p1.to_s.to_sym]
      p2_label = pin_labels[p2] || pin_labels[p2.to_s] || pin_labels[p2.to_s.to_sym]

      pin_x = pin_x_at(pin)
      mid_pin_x = pin_x + pin_width / 2

      # bottom / left label
      Path.new(pin_x, chip_bottom)
        .delta(0, inner_pin_height)
        .arc_delta([pin_r, 0], angle: -1.pi/2)
        .delta(inner_pin_width, 0)
        .arc_delta([0, -pin_r], angle: -1.pi/2)
        .delta(0, -inner_pin_height)
        .stroke(:black)
        .line_width(0.5)
        .fill(pin_color1 || :clear)
        .draw

      t = Text.new(p1.formatted(attrs))
        .color(:black)
        .translate([mid_pin_x, chip_bottom + pin_height / 2])
        .rotate(vertical? ? -90.degrees : 0)
        .stroke_width(PinStrokeWidth)
        .draw

      if p1_label
        if p1_label.is_a?(Decoration)
          p1_label.orientation = self.orientation
          p1_label.bottom.draw_at(mid_pin_x, chip_bottom + pin_height)
        else
          if p1_label.is_a?(Label)
            text = p1_label.text
            overbar = p1_label.overbar?
            underbar = p1_label.underbar?
          else
            text = p1_label
            overbar = false
            underbar = false
          end

          border = []
          border << :top if overbar
          border << :bottom if underbar

          t = Text.new(text.formatted(attrs))
            .border(border)
            .color(:black)
            .translate([mid_pin_x, chip_bottom + pin_height + 2])
            .stroke_width(BoldStrokeWidth)
          if vertical?
            t.valign(:center)
            t.halign(:right)
            t.rotate(-90.degrees)
          else
            t.valign(:top)
            t.halign(:center)
            t.rotate(0.degrees)
          end
          t.draw
        end
      end

      # top / right label
      Path.new(pin_x, chip_top)
        .delta(0, -inner_pin_height)
        .arc_delta([pin_r, 0], angle: 1.pi/2)
        .delta(inner_pin_width, 0)
        .arc_delta([0, pin_r], angle: 1.pi/2)
        .delta(0, inner_pin_height)
        .stroke(:black)
        .line_width(0.5)
        .fill(pin_color2 || :clear)
        .draw

      t = Text.new(p2.formatted(attrs))
        .color(:black)
        .translate([mid_pin_x, chip_top - pin_height / 2])
        .rotate(vertical? ? -90.degrees : 0)
        .stroke_width(PinStrokeWidth)
        .draw

      if p2_label
        if p2_label.is_a?(Decoration)
          p2_label.orientation = self.orientation
          p2_label.top.draw_at(mid_pin_x, chip_top - pin_height)
        else
          if p2_label.is_a?(Label)
            text = p2_label.text
            overbar = p2_label.overbar?
            underbar = p2_label.underbar?
          else
            text = p2_label
            overbar = false
            underbar = false
          end

          border = []
          border << :top if overbar
          border << :bottom if underbar

          t = Text.new(text.formatted(attrs))
            .border(border)
            .color(:black)
            .translate([mid_pin_x, chip_top - pin_height - 2])
            .stroke_width(BoldStrokeWidth)
          if vertical?
            t.valign(:center)
            t.halign(:left)
            t.rotate(-90.degrees)
          else
            t.valign(:bottom)
            t.halign(:center)
            t.rotate(0.degrees)
          end
          t.draw
        end
      end
    end

    Path.new(chip_left, chip_top)
      .delta(chip_height, 0)
      .delta(0, chip_width)
      .delta(-chip_height, 0)
      .delta(0, -chip_width / 2 + indent_radius)
      .arc_delta([0, -indent_radius], angle: -1.pi)
      .close
      .stroke(:black)
      .fill(chip_color)
      .draw

    groups.each do |group|
      pin_a, pin_b = group
      pin_a -= 1
      pin_b -= 1

      if pin_a < half_pins
        pin_a, pin_b = [pin_a, pin_b].min, [pin_a, pin_b].max
        top = chip_bottom
        direction = 1
      else
        pin_b, pin_a = [pin_a, pin_b].min, [pin_a, pin_b].max
        top = chip_top
        direction = -1
      end
      top += direction * pin_height

      pin_a_x = pin_x_at(pin_a)
      pin_b_x = pin_x_at(pin_b) + pin_width
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

    if title
      Text.new(title.formatted(attrs(10)))
        .color(:black)
        .stroke_width(BoldStrokeWidth)
        .translate([chip_left - 10, center_y])
        .rotate(-0.5.pi)
        .draw
    end

    if desc
      Text.new(desc.formatted(attrs(10)))
        .color(:black)
        .stroke_width(BoldStrokeWidth)
        .translate([chip_left + indent_radius + (chip_height - indent_radius) / 2, center_y])
        .rotate(vertical? ? -180.degrees : 0)
        .draw
    end
  end

end
