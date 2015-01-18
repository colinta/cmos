module LT1302

  def lt1302_style
    cmos_style

    title 'LT1302'
    pins 8
    pin_margin 10
    pin_labels 1 => Ground.new,
      2  => Vss.new,
      3  => 'EN',
      4  => 'SENSE',
      5  => 'I',
      6  => Vdd.new,
      7  => 'SW',
      8  => Ground.new
    pin_colors 1 => :ground,
      2 => :vss,
      3 => :en,
      4 => :out,
      5 => :nc,
      6 => :vdd,
      7 => :in,
      8 => :ground
  end

end
