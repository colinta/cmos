module TTL7400

  def ttl7400_style
    cmos_style

    title '7400'
    desc 'Quad 2-input NAND'
    pins 14
    pin_labels 1 => 'A'.fsub('o'),
      2  => 'A'.fsub('1'),
      3  => 'A'.fsub('2'),
      4  => 'B'.fsub('o'),
      5  => 'B'.fsub('1'),
      6  => 'B'.fsub('2'),
      7  => Ground.new,
      8  => 'C'.fsub('2'),
      9  => 'C'.fsub('1'),
      10 => 'C'.fsub('o'),
      11 => 'D'.fsub('2'),
      12 => 'D'.fsub('1'),
      13 => 'D'.fsub('o'),
      14 => Vdd.new
    pin_colors 1 => :a_out,
      2 => :a_in,
      3 => :a_in,
      4 => :b_out,
      5 => :b_in,
      6 => :b_in,
      7 => :ground,
      8 => :c_in,
      9 => :c_in,
      10=> :c_out,
      11=> :d_in,
      12=> :d_in,
      13=> :d_out,
      14=> :vdd
    groups << [1,3]
    groups << [4,6]
    groups << [8,10]
    groups << [11,13]
  end

end
