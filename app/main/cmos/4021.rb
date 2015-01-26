# Quad 2-in NOR
module CD4021

  def cmos4021_style
    cmos_style

    title 'CD4021'
    desc '8 stage ShiftIn register'
    pins 16
    pin_labels 1 => 'I'.fsub('8'),
      2  => 'O'.fsub('6'),
      3  => 'OUT'.fbold.fsub('8'),
      4  => 'I'.fsub('4'),
      5  => 'I'.fsub('3'),
      6  => 'I'.fsub('2'),
      7  => 'I'.fsub('1'),
      8  => Ground.new,
      9  => 'P/S',
      10 => 'CLK',
      11 => 'IN'.fbold,
      12 => 'O'.fsub('7'),
      13 => 'I'.fsub('5'),
      14 => 'I'.fsub('6'),
      15 => 'I'.fsub('7'),
      16 => Vdd.new
    pin_colors 1 => :in,
      2  => :out,
      3  => :out,
      4  => :in,
      5  => :in,
      6  => :in,
      7  => :in,
      8  => :ground,
      9  => :en,
      10 => :clk,
      11 => :co,
      12 => :out,
      13 => :in,
      14 => :in,
      15 => :in,
      16 => :vdd
    groups << [1,1]
    groups << [4,7]
    groups << [13,15]
  end

end
