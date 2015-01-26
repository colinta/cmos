module CD4052

  def cmos4052_style
    cmos_style

    title 'CD4052'
    desc '4-channel MUX/DEMUX'
    pins 16
    pin_labels 1 => 'Y'.fsub('1'),
      2  => 'Y'.fsub('3'),
      3  => '<->',
      4  => 'Y'.fsub('4'),
      5  => 'Y'.fsub('2'),
      6  => 'EN',
      7  => Vss.new,
      8  => Ground.new,
      9  => 'S'.fsub('1'),
      10 => 'S'.fsub('0'),
      11 => 'X'.fsub('4'),
      12 => 'X'.fsub('1'),
      13 => '<->',
      14 => 'X'.fsub('2'),
      15 => 'X'.fsub('3'),
      16 => Vdd.new
    pin_colors 1 => :group_1,
      2  => :group_1,
      3  => :group_1,
      4  => :group_1,
      5  => :group_1,
      6  => :en,
      7  => :vss,
      8  => :ground,
      9  => :addr,
      10 => :addr,
      11 => :group_2,
      12 => :group_2,
      13 => :group_2,
      14 => :group_2,
      15 => :group_2,
      16 => :vdd
    groups << [1,5]
    groups << [9,10]
    groups << [11,15]
  end

end
