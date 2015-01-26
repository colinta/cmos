module CD4020

  def cmos4020_style
    cmos_style

    title 'CD4020'
    desc '14-bit Counter'
    pins 16
    pin_labels 1 => '12',
      2  => '13',
      3  => '14',
      4  => '6',
      5  => '5',
      6  => '7',
      7  => '4',
      8  => Ground.new,
      9  => '1',
      10 => 'CLK',
      11 => 'RST'.overbar,
      12 => '9',
      13 => '8',
      14 => '6',
      15 => '11',
      16 => Vdd.new
    pin_colors 1 => :out,
      2  => :out,
      3  => :out,
      4  => :out,
      5  => :out,
      6  => :out,
      7  => :out,
      8  => :ground,
      9  => :out,
      10 => :clk,
      11 => :rst,
      12 => :out,
      13 => :out,
      14 => :out,
      15 => :out,
      16 => :vdd
    groups << [1,7]
    groups << [9,9]
    groups << [12,15]
  end

end
