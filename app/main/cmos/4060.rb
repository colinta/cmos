module CD4060

  def cmos_4060_style
    cmos_style

    title 'CD4060'
    pins 16
    pin_labels 1 => 'Q'.fsub('12'),
      2  => 'Q'.fsub('13'),
      3  => 'Q'.fsub('14'),
      4  => 'Q'.fsub('6'),
      5  => 'Q'.fsub('5'),
      6  => 'Q'.fsub('7'),
      7  => 'Q'.fsub('4'),
      8  => Ground.new,
      9  => 'Cτ',
      10 => 'Rτ',
      11 => 'CLK',
      12 => 'RST',
      13 => 'Q'.fsub('9'),
      14 => 'Q'.fsub('8'),
      15 => 'Q'.fsub('10'),
      16 => Vdd.new
    pin_colors 1 => :out,
      2  => :out,
      3  => :out,
      4  => :out,
      5  => :out,
      6  => :out,
      7  => :out,
      8  => :ground,
      9  => :co,
      10 => :co,
      11 => :clk,
      12 => :rst,
      13 => :out,
      14 => :out,
      15 => :out,
      16 => :vdd
    groups << [9,11]
  end

end
