module TTL7410

  def ttl7410_style
    cmos_style

    title '7410'
    desc 'Triple 3-input NAND'
    pins 14
    pin_labels 1 => 'A'.fsub('1'),
      2  => 'A'.fsub('2'),
      3  => 'B'.fsub('1'),
      4  => 'B'.fsub('2'),
      5  => 'B'.fsub('3'),
      6  => 'B'.fsub('o'),
      7  => Ground.new,
      8  => 'C'.fsub('o'),
      9  => 'C'.fsub('3'),
      10 => 'C'.fsub('2'),
      11 => 'C'.fsub('1'),
      12 => 'A'.fsub('o'),
      13 => 'A'.fsub('3'),
      14 => Vdd.new
    pin_colors 1 => :a_in,
      2 => :a_in,
      3 => :b_in,
      4 => :b_in,
      5 => :b_in,
      6 => :b_out,
      7 => :ground,
      8 => :c_out,
      9 => :c_in,
      10=> :c_in,
      11=> :c_in,
      12=> :a_out,
      13=> :a_in,
      14=> :vdd
    groups << [1,2]
    groups << [3,6]
    groups << [8,11]
    groups << [12,13]
  end

end
