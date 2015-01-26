module TTL7486

  def ttl7486_style
    cmos_style

    title '7486'
    desc 'Quad 2-input XOR'
    pins 14
    pin_labels 1 => 'A'.fsub('1'),
      2  => 'A'.fsub('2'),
      3  => 'A'.fsub('o'),
      4  => 'B'.fsub('1'),
      5  => 'B'.fsub('2'),
      6  => 'B'.fsub('o'),
      7  => Ground.new,
      8  => 'C'.fsub('o'),
      9  => 'C'.fsub('2'),
      10 => 'C'.fsub('1'),
      11 => 'D'.fsub('o'),
      12 => 'D'.fsub('2'),
      13 => 'D'.fsub('1'),
      14 => Vdd.new
    pin_colors 1 => :a_in,
      2 => :a_in,
      3 => :a_out,
      4 => :b_in,
      5 => :b_in,
      6 => :b_out,
      7 => :ground,
      8 => :c_out,
      9 => :c_in,
      10=> :c_in,
      11=> :d_out,
      12=> :d_in,
      13=> :d_in,
      14=> :vdd
    groups << [1,3]
    groups << [4,6]
    groups << [8,10]
    groups << [11,13]
  end

end
