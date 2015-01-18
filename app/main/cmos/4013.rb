module CD4013

  def cmos_4013_style
    cmos_style

    title 'CD4013'
    pins 14
    pin_labels 1 => 'Q'.fsub('A'),
      2  => 'Q'.fsub('A').overbar,
      3  => 'CLK'.fsub('A'),
      4  => 'RST'.fsub('A'),
      5  => 'DATA'.fsub('A'),
      6  => 'SET'.fsub('A'),
      7  => Ground.new,
      8  => 'SET'.fsub('B'),
      9  => 'DATA'.fsub('B'),
      10 => 'RST'.fsub('B'),
      11 => 'CLK'.fsub('B'),
      12 => 'Q'.fsub('B').overbar,
      13 => 'Q'.fsub('B'),
      14 => Vdd.new
    pin_colors 1 => :out,
      2  => :out,
      3  => :clk,
      4  => :rst,
      5  => :in,
      6  => :rst,
      7  => :ground,
      8  => :rst,
      9  => :in,
      10 => :rst,
      11 => :clk,
      12 => :out,
      13 => :out,
      14 => :vdd
    groups << [1,2]
    groups << [12,13]
  end

end
