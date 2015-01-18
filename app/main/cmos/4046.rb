module CD4046

  def cmos_4046_style
    cmos_style

    title 'CD4046 PLL'
    pins 16
    pin_labels 1 => 'PULS',
      2  => 'PC1'.fsub('o'),
      3  => 'CMP'.fsub('i'),
      4  => 'VCO'.fsub('o'),
      5  => 'EN',
      6  => 'C'.fsub('1'),
      7  => 'C'.fsub('2'),
      8  => Ground.new,
      9  => 'VCO'.fsub('i'),
      10 => 'DEM'.fsub('o'),
      11 => 'R'.fsub('1'),
      12 => 'R'.fsub('2'),
      13 => 'PC2'.fsub('o'),
      14 => 'IN',
      15 => 'ZEN',
      16 => Vdd.new
    pin_colors 1 => :in,
      2  => :out,
      3  => :in,
      4  => :out,
      5  => :en,
      6  => :c_in,
      7  => :c_in,
      8  => :ground,
      9  => :in,
      10 => :out,
      11 => :c_out,
      12 => :c_out,
      13 => :out,
      14 => :in,
      15 => :rst,
      16 => :vdd
    groups << [6,7]
    groups << [11,12]
  end

end
