module CD4017

  def cmos4017_style
    cmos_style

    title 'CD4017'
    desc '10-stage Johnson Counter'
    pins 16
    pin_labels 1 => 'Q6',
      2  => 'Q2',
      3  => 'Q1',
      4  => 'Q3',
      5  => 'Q7',
      6  => 'Q8',
      7  => 'Q4',
      8  => Ground.new,
      9  => 'Q9',
      10 => 'Q5',
      11 => 'Q10',
      12 => 'CO',
      13 => 'EN'.underbar,
      14 => 'CLK',
      15 => 'RST'.overbar,
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
      10 => :out,
      11 => :out,
      12 => :co,
      13 => :en,
      14 => :clk,
      15 => :rst,
      16 => :vdd
    groups << [1, 7]
    groups << [9, 11]
  end

end
