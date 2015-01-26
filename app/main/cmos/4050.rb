module CD4050

  def cmos4050_style
    cmos_style

    title 'CD4050'
    desc 'Hex Buffers'
    pins 16
    pin_labels 1 => Vdd.new,
      2  => 'A'.fsub('o'),
      3  => 'A'.fsub('i'),
      4  => 'B'.fsub('o'),
      5  => 'B'.fsub('i'),
      6  => 'C'.fsub('o'),
      7  => 'C'.fsub('i'),
      8  => Ground.new,
      9  => 'D'.fsub('i'),
      10 => 'D'.fsub('o'),
      11 => 'E'.fsub('i'),
      12 => 'E'.fsub('o'),
      13 => 'NC'.fbold,
      14 => 'F'.fsub('i'),
      15 => 'F'.fsub('o'),
      16 => 'NC'.fbold
    pin_colors 1 => :vdd,
      2  => :a_out,
      3  => :a_in,
      4  => :b_out,
      5  => :b_in,
      6  => :c_out,
      7  => :c_in,
      8  => :ground,
      9  => :d_in,
      10 => :d_out,
      11 => :e_in,
      12 => :e_out,
      13 => :nc,
      14 => :f_in,
      15 => :f_out,
      16 => :nc
    groups << [2, 3]
    groups << [4, 5]
    groups << [6, 7]
    groups << [9, 10]
    groups << [11, 12]
    groups << [14, 15]
  end

end
