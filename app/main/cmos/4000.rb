module CD4000

  def cmos4000_style
    cmos_style

    title 'CD4000'
    desc 'Dual 3-input NOR'
    pins 14
    pin_labels 1 => '',
      2  => '',
      3  => 'A'.fsub('1'),
      4  => 'A'.fsub('2'),
      5  => 'A'.fsub('3'),
      6  => 'A'.fsub('o'),
      7  => Ground.new,
      8  => 'I'.fsub('i'),
      9  => 'I'.fsub('o'),
      10 => 'B'.fsub('o'),
      11 => 'B'.fsub('1'),
      12 => 'B'.fsub('2'),
      13 => 'B'.fsub('3'),
      14 => Vdd.new
    pin_colors 1 => :nc,
      2  => :nc,
      3  => :a_in,
      4  => :a_in,
      5  => :a_in,
      6  => :a_out,
      7  => :ground,
      8  => :c_in, # Ii
      9  => :c_out, # Io
      10 => :b_out,
      11 => :b_in,
      12 => :b_in,
      13 => :b_in,
      14 => :vdd
    groups << [3, 6]
    groups << [8, 9]
    groups << [10, 13]
  end

end
