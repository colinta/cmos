module PCF8574

  def pcf8574_style
    cmos_style

    title 'PCF8574'
    desc '8-bit I/O Expander'
    pins 16
    pin_labels 1 => 'S'.fsub('0'),
      2  => 'S'.fsub('1'),
      3  => 'S'.fsub('2'),
      4  => '1',
      5  => '2',
      6  => '3',
      7  => '4',
      8  => Ground.new,
      9  => '5',
      10 => '6',
      11 => '7',
      12 => '8',
      13 => 'INT'.overbar,
      14 => 'SCL',
      15 => 'SDA',
      16 => Vdd.new
    pin_colors 1 => :addr,
      2 => :addr,
      3 => :addr,
      4 => :in,
      5 => :in,
      6 => :in,
      7 => :in,
      8 => :ground,
      9 => :in,
      10=> :in,
      11=> :in,
      12=> :in,
      13 => :int,
      14=> :scl,
      15=> :sda,
      16 => :vdd
    groups << [1,3]
    groups << [4,7]
    groups << [9,12]
  end

end
