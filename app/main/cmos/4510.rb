module CD4510

  def cmos4510_style
    cmos_style

    title 'CD4510'
    desc '4-bit up/down Counter, BCD out'
    pins 16
    pin_labels 1 => 'EN',
      2  => 'O'.fsub('4'),
      3  => 'P'.fsub('4'),
      4  => 'P'.fsub('1'),
      5  => 'CAR'.fsub('i'),
      6  => 'O'.fsub('1'),
      7  => 'CAR'.fsub('o'),
      8  => Ground.new,
      9  => 'RST',
      10 => 'U/D',
      11 => 'O'.fsub('2'),
      12 => 'P'.fsub('2'),
      13 => 'P'.fsub('3'),
      14 => 'O'.fsub('3'),
      15 => 'CLK',
      16 => Vdd.new
    pin_colors 1 => :en,
      2 => :out,
      3 => :in,
      4 => :in,
      5 => :co,
      6 => :out,
      7 => :co,
      8 => :ground,
      9 => :rst,
      10=> :en,
      11=> :out,
      12=> :in,
      13=> :in,
      14=> :out,
      15=> :clk,
      16=> :vdd
    groups << [3,4]
    groups << [12,13]
  end

end
