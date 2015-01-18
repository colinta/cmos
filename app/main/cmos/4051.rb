module CD4051

  def cmos_4051_style
    cmos_style

    title 'CD4051'
    pins 16
    pin_labels 1 => 'I'.fsub('6'),
      2  => 'I'.fsub('7'),
      3  => 'I/O',
      4  => 'I'.fsub('8'),
      5  => 'I'.fsub('6'),
      6  => 'EN'.fsub('7'),
      7  => Vss.new,
      8  => Ground.new,
      9  => 'S'.fsub('2'),
      10 => 'S'.fsub('1'),
      11 => 'S'.fsub('0'),
      12 => 'I'.fsub('4'),
      13 => 'I'.fsub('1'),
      14 => 'I'.fsub('2'),
      15 => 'I'.fsub('3'),
      16 => Vdd.new
    pin_colors 1 => :out,
      2  => :out,
      3  => :in,
      4  => :out,
      5  => :out,
      6  => :en,
      7  => :vss,
      8  => :ground,
      9  => :addr,
      10 => :addr,
      11 => :addr,
      12 => :out,
      13 => :out,
      14 => :out,
      15 => :out,
      16 => :vdd
    groups << [9,11]
  end

end
