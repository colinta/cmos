# Quad 2-in NOR
module CD4001

  def cmos4001_style
    cmos_style

    title 'CD4001'
    desc 'Quad 2-input NOR'
    pins 14
    pin_labels 1 => 'A'.fsub('1'),
      2  => 'A'.fsub('2'),
      3  => 'A'.fsub('o'),
      4  => 'B'.fsub('0'),
      5  => 'B'.fsub('1'),
      6  => 'B'.fsub('2'),
      7  => Ground.new,
      8  => 'C'.fsub('1'),
      9  => 'C'.fsub('2'),
      10 => 'C'.fsub('o'),
      11 => 'D'.fsub('o'),
      12 => 'D'.fsub('1'),
      13 => 'D'.fsub('2'),
      14 => Vdd.new
    pin_colors 1 => :a_in,# A1
      2  => :a_in, # A2
      3  => :a_out, # Ao
      4  => :b_out, # Bo
      5  => :b_in, # B1
      6  => :b_in, # B2
      7  => :ground,
      8  => :c_in,
      9  => :c_in,
      10 => :c_out,
      11 => :d_out,
      12 => :d_in,
      13 => :d_in,
      14 => :vdd
    groups << [1,3]
    groups << [4,6]
    groups << [8,10]
    groups << [11,13]
  end

end
