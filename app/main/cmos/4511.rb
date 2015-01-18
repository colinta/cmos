module CD4511

  def cmos_4511_style
    cmos_style

    title 'CD4511'
    pins 16
    pin_labels 1 => 'A'.fsub('2'),
      2  => 'A'.fsub('3'),
      3  => 'LT'.overbar,
      4  => 'BL'.overbar,
      5  => 'EN',
      6  => 'A'.fsub('4'),
      7  => 'A'.fsub('1'),
      8  => Ground.new,
      9  => 'e',
      10 => 'd',
      11 => 'c',
      12 => 'b',
      13 => 'a',
      14 => 'g',
      15 => 'f',
      16 => Vdd.new
    pin_colors 1 => :in,
      2  => :in,
      3  => :rst,
      4  => :co,
      5  => :en,
      6  => :in,
      7  => :in,
      8  => :ground,
      9  => :out,
      10 => :out,
      11 => :out,
      12 => :out,
      13 => :out,
      14 => :out,
      15 => :out,
      16 => :vdd
    groups << [1,2]
    groups << [6,7]
    groups << [9,15]
  end

end
