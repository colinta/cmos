# @requires GM::Drawler
class TO220 < UIView
  include GM::D
  attr_updates :title
  attr_updates :chip_height
  attr_updates :chip_width
  attr_updates :pins
  attr_updates :pin_labels
  attr_updates :pin_rotation

  ChipHeight = 50
  ChipWidth = 50
  SinkRadius = 10
  PinFontSize = 12.0
  PinStrokeWidth = 4.0

  def attrs
    @attrs ||= {
      'normal' => { NSFontAttributeName => :monospace.uifont(PinFontSize), NSStrokeWidthAttributeName => 3, },
      'bold' => { NSFontAttributeName => :monospace.uifont(PinFontSize), NSStrokeWidthAttributeName => 5, },
    }
  end

  def pin_labels
    @pin_labels ||= {}
  end

  def pins
    @pins ||= 3
  end

  def chip_height
    @chip_height || ChipHeight
  end

  def chip_width
    @chip_width || ChipWidth
  end

  def chip_color
    @chip_color || :black.uicolor(0.2)
  end

  def sink_height
    sink_radius * 2 + sink_margin * 2
  end

  def sink_margin
    3
  end

  def sink_radius
    @sink_radius || SinkRadius
  end

  def sink_color
    '#b3b3b3'
  end

  def pin_width
    4
  end

  def pin_margin
    3
  end

  def pin_length
    100
  end

  def pin_bend_start
    10
  end

  def pin_bend_length
    25
  end

  def pin_max_bend
    20
  end

  def wide_length
    10
  end

  def drawRect(rect)
    center_y = self.height / 2

    total_height = pin_length + chip_height + sink_height
    chip_left = (self.width - total_height) / 2
    chip_top = (self.height - chip_width) / 2
    center_y = self.height / 2

    Path.new(chip_left, chip_top)
      .delta(sink_height, 0)
      .delta(0, chip_width)
      .delta(-sink_height, 0)
      .delta(0, -chip_width)
      .move_to(chip_left + sink_margin, center_y)
      .arc_delta([sink_radius, 0], angle: -2.pi)
      .stroke(:black)
      .line_width(0.5)
      .fill(sink_color || :clear)
      .draw

    pin_left = chip_left + sink_height + chip_height
    pin_start_top = chip_top + (chip_width - pins * pin_width - (pins - 1) * pin_margin) / 2
    pins.times do |pin_index|
      pin_top = pin_start_top + pin_index * (pin_width + pin_margin)
      if pins == 1
        pin_bend_amount = 0
      else
        pin_bend_amount = -pin_max_bend + 2.0 * pin_max_bend / (pins - 1) * pin_index
      end
      wide_delta = 1
      p = Path.new(pin_left, pin_top)
        .delta(wide_length, 0)
        .delta(0, wide_delta)
        .delta(pin_bend_start, 0)
        .delta(pin_bend_length, pin_bend_amount)
        .delta(pin_length - wide_length - pin_bend_length - pin_bend_start, 0)
        .delta(0, pin_width - 2 * wide_delta)
        .delta(pin_bend_start + pin_bend_length + wide_length - pin_length, 0)
        .delta(-pin_bend_length, -pin_bend_amount)
        .delta(-pin_bend_start, 0)
        .delta(0, wide_delta)
        .delta(-wide_length, 0)
        .delta(0, -pin_width)
        .stroke(:black)
        .line_width(0.5)
        .fill(sink_color || :clear)
        .draw

      pin = pins - pin_index
      label = pin_labels[pin] || pin_labels[pin.to_s] || pin_labels[pin.to_s.to_sym]
      if label
        label_x = pin_left + pin_length + 2
        label_y = pin_top + pin_bend_amount + pin_width / 2
        Text.new(label.formatted(attrs))
          .valign(pin_rotation ? :top : :center)
          .halign(pin_rotation ? :center : :left)
          .translate([label_x, label_y])
          .rotate(pin_rotation ? -90.degrees : 0)
          .color(:black)
          .font(:monospace.uifont(PinFontSize))
          .stroke_width(PinStrokeWidth)
          .draw
      end
    end

    Path.new(chip_left + sink_height, chip_top)
      .delta(chip_height, 0)
      .delta(0, chip_width)
      .delta(-chip_height, 0)
      .delta(0, -chip_width)
      .stroke(:black)
      .line_width(0.5)
      .fill(chip_color || :clear)
      .draw

    if title
      Text.new(title.formatted(attrs))
        .translate([chip_left + sink_height + chip_height / 2, chip_top + chip_width / 2])
        .rotate(-90.degrees)
        .color(:black)
        .font(:monospace.uifont(PinFontSize))
        .stroke_width(PinStrokeWidth)
        .draw
    end
  end

end
