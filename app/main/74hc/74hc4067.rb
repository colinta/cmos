module IC_74HC4067

  def ic_74hc4067_style
    cmos_style

    pins 24
    title '74HC4067'
    desc '6-channel MUX/DEMUX'
    pin_margin 10
    pin_labels 1 => 'I/O',
      2  => '7',
      3  => '6',
      4  => '5',
      5  => '4',
      6  => '3',
      7  => '2',
      8  => '1',
      9  => '0',
      10 => 'S'.fsub('0'),
      11 => 'S'.fsub('1'),
      12 => Ground.new,
      13 => 'S'.fsub('3'),
      14 => 'S'.fsub('2'),
      15 => 'EN'.underbar,
      16 => '15',
      17 => '14',
      18 => '13',
      19 => '12',
      20 => '11',
      21 => '10',
      22 => '9',
      23 => '8',
      24 => Vdd.new
    pin_colors 1 => :in,
      2  => :out,
      3  => :out,
      4  => :out,
      5  => :out,
      6  => :out,
      7  => :out,
      8  => :out,
      9  => :out,
      10 => :addr,
      11 => :addr,
      12 => :ground,
      13 => :addr,
      14 => :addr,
      15 => :en,
      16 => :out,
      17 => :out,
      18 => :out,
      19 => :out,
      20 => :out,
      21 => :out,
      22 => :out,
      23 => :out,
      24 => :vdd
    groups << [2,9]
    groups << [10,11]
    groups << [13,14]
    groups << [16,23]
  end

end
