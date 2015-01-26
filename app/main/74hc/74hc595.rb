module IC_74HC595

  def ic_74hc595_style
    cmos_style

    pins 16
    title '74HC595'
    desc '8-bit ShiftOut register'
    pin_labels 1 => '2',
      2  => '3',
      3  => '4',
      4  => '5',
      5  => '6',
      6  => '7',
      7  => '8',
      8  => Ground.new,
      9  => 'SO',
      10 => 'RST'.underbar,
      11 => 'CLK',
      12 => 'LAT',
      13 => 'EN'.underbar,
      14 => 'In',
      15 => '1',
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
      10 => :rst,
      11 => :clk,
      12 => :addr,
      13 => :en,
      14 => :in,
      15 => :out,
      16 => :vdd
    groups << [1,7]
    groups << [15,15]
  end

end
