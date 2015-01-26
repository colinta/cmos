module TTL7474

  def ttl7474_style
    cmos_style

    title '7474'
    desc 'Dual D-type flip-flop'
    pins 14
    pin_labels 1 => 'RST',
      2  => 'D',
      3  => 'CLK',
      4  => 'SET',
      5  => 'Q',
      6  => 'Q'.overbar,
      7  => Ground.new,
      8  => 'Q'.overbar,
      9  => 'Q',
      10 => 'SET',
      11 => 'CLK',
      12 => 'D',
      13 => 'RST',
      14 => Vdd.new
    pin_colors 1 => :rst,
      2 => :in,
      3 => :clk,
      4 => :rst,
      5 => :out,
      6 => :out,
      7 => :ground,
      8 => :out,
      9 => :out,
      10=> :rst,
      11=> :clk,
      12=> :in,
      13=> :rst,
      14=> :vdd
    groups << [1,6]
    groups << [8,13]
  end

end
