module CD4518

  def cmos4518_style
    cmos_style

    title 'CD4518'
    desc 'Dual BCD Up Counter'
    pins 16
    pin_labels 1 => 'CLK'.fsub('B'),
      2  => 'EN'.fsub('B'),
      3  => 'B'.fbold.fsub('1'),
      4  => 'B'.fsub('2'),
      5  => 'B'.fsub('3'),
      6  => 'B'.fsub('4'),
      7  => 'RST'.fsub('B'),
      8  => Ground.new,
      9  => 'CLK'.fsub('A'),
      10 => 'EN'.fsub('A'),
      11 => 'A'.fsub('1'),
      12 => 'A'.fsub('2'),
      13 => 'A'.fsub('3'),
      14 => 'A'.fsub('4'),
      15 => 'RST'.fsub('B'),
      16 => Vdd.new
    pin_colors 1 => :clk,
      2  => :en,
      3  => :out,
      4  => :out,
      5  => :out,
      6  => :out,
      7  => :rst,
      8  => :ground,
      9  => :clk,
      10 => :en,
      11 => :out,
      12 => :out,
      13 => :out,
      14 => :out,
      15 => :rst,
      16 => :vdd
    groups << [3,6]
    groups << [11,14]
  end

end
