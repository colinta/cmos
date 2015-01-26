module Attiny85

  def attiny85_style
    cmos_style

    filename 'attiny85'
    desc 'Attiny 85'
    pins 8
    pin_labels 1 => 'RST',
      2 => '4',
      3 => '5',
      4 => Ground.new,
      5 => '3',
      6 => '2',
      7 => '1',
      8 => Vdd.new
    pin_colors 1 => :rst,
      2 => :in,
      3 => :in,
      4 => :ground,
      5 => :in,
      6 => :in,
      7 => :in,
      8 => :vdd
  end

  def attiny85_vert_style
    attiny85_style
    orientation :vertical
    filename 'attiny85_vert'
  end

end
