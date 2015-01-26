module L293D

  def l293d_style
    cmos_style

    title 'L293D'
    desc 'Dual H-bridge motor driver'
    pins 16
    pin_labels 1 => 'EN'.overbar,
      2  => 'A'.fsub('i'),
      3  => 'A'.fsub('o'),
      4  => Ground.new,
      5  => Ground.new,
      6  => 'B'.fsub('o'),
      7  => 'B'.fsub('i'),
      8  => 'V'.fsub('s'),
      9  => 'EN'.overbar,
      10 => 'C'.fsub('i'),
      11 => 'C'.fsub('o'),
      12 => Ground.new,
      13 => Ground.new,
      14 => 'D'.fsub('o'),
      15 => 'D'.fsub('i'),
      16 => Vdd.new
    pin_colors 1 => :en,
      2  => :a_in,
      3  => :a_out,
      4  => :ground,
      5  => :ground,
      6  => :b_out,
      7  => :b_in,
      8  => :ground,
      9  => :en,
      10 => :c_in,
      11 => :c_out,
      12 => :ground,
      13 => :ground,
      14 => :d_out,
      15 => :d_in,
      16 => :vdd
    groups << [2,4]
    groups << [5,7]
    groups << [10,12]
    groups << [13,15]
  end

end
