module IC_555

  def ic_555_style
    cmos_style

    title '555'
    desc "The one\nThe only\nThe 555"
    pins 8
    pin_labels 1 => Ground.new,
      2 => 'TRIG',
      3 => 'OUT',
      4 => 'RST',
      5 => 'CTRL',
      6 => 'THRES',
      7 => 'DISCH',
      8 => Vdd.new
    pin_colors 1 => :ground,
      2 => :data,
      3 => :out,
      4 => :rst,
      5 => :clk,
      6 => :addr,
      7 => :co,
      8 => :vdd
  end

  def ic_555_vert_style
    ic_555_style
    orientation :vertical
    filename '555_vert'
  end

end
