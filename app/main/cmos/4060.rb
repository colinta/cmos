module CD4060

  def cmos4060_style
    cmos_style

    title 'CD4060'
    desc '14-bit binary counter'
    pins 16
    pin_labels 1 => '12',
      2  => '13',
      3  => '14',
      4  => '6',
      5  => '5',
      6  => '7',
      7  => '4',
      8  => Ground.new,
      9  => 'Cτ',
      10 => 'Rτ',
      11 => 'CLK',
      12 => 'RST',
      13 => '9',
      14 => '8',
      15 => '10',
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
