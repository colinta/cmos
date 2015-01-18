module CD4002

  def cmos_4002_style
    cmos_style

    title 'CD4002'
    pins 14
    pin_labels 1 => 'A'.fsub('o'),
      2  => 'A'.fsub('1'),
      3  => 'A'.fsub('2'),
      4  => 'A'.fsub('3'),
      5  => 'A'.fsub('4'),
      6  => 'NC'.fbold,
      7  => Ground.new,
      8  => 'NC'.fbold,
      9  => 'B'.fsub('1'),
      10 => 'B'.fsub('2'),
      11 => 'B'.fsub('3'),
      12 => 'B'.fsub('4'),
      13 => 'B'.fsub('o'),
      14 => Vdd.new
    pin_colors 1 => :a_out,
      2  => :a_in,
      3  => :a_out,
      4  => :a_out,
      5  => :a_out,
      6  => :nc,
      7  => :ground,
      8  => :nc,
      9  => :b_in,
      10 => :b_in,
      11 => :b_in,
      12 => :b_in,
      13 => :b_out,
      14 => :vdd
    groups << [2,5]
    groups << [9,12]
  end

end
