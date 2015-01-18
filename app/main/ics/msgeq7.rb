module MSGEQ7

  def msgeq7_style
    cmos_style

    title 'MSG EQ7'
    pins 8
    pin_margin 10
    pin_labels 1 => Vdd.new,
      2  => Ground.new,
      3  => 'OUT',
      4  => 'Strobe',
      5  => 'IN',
      6  => Vss.new,
      7  => 'RST',
      8  => 'CLK'
    pin_colors 1 => :vdd,
      2 => :ground,
      3 => :out,
      4 => :en,
      5 => :in,
      6 => :vss,
      7 => :rst,
      8 => :clk
  end

end
