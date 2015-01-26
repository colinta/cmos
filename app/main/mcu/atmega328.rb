module Atmega328

  def atmega328_style
    cmos_style

    filename 'atmega328'
    desc 'Atmega 328'
    pins 28
    pin_margin 7
    pin_width 14
    pin_labels 1 => 'PC6',
      2 => 'PD0',
      3 => 'PD1',
      4 => 'PD2',
      5 => 'PD3',
      6 => 'PD4',
      7 => Vdd.new,
      8 => Ground.new,
      9 => 'PB6',
      10=> 'PB7',
      11=> 'PD5',
      12=> 'PD6',
      13=> 'PD7',
      14=> 'PB0',
      15=> 'PB1',
      16=> 'PB2',
      17=> 'PB3',
      18=> 'PB4',
      19=> 'PB5',
      20=> 'AVcc',
      21=> 'AREF',
      22=> Ground.new,
      23=> 'PC0',
      24=> 'PC1',
      25=> 'PC2',
      26=> 'PC3',
      27=> 'PC4',
      28=> 'PC5'
    pin_colors 1 => :addr,
      2 => :in,
      3 => :out,
      4 => :int,
      5 => :int,
      6 => :int,
      7 => :vdd,
      8 => :ground,
      9 => :data,
      10=> :data,
      11=> :int,
      12=> :int,
      13=> :int,
      14=> :data,
      15=> :data,
      16=> :data,
      17=> :a_out,
      18=> :a_in,
      19=> :clk,
      20=> :vss,
      21=> :nc,
      22=> :ground,
      23=> :addr,
      24=> :addr,
      25=> :addr,
      26=> :addr,
      27=> :sda,
      28=> :scl
  end

  def atmega328_vert_style
    atmega328_style
    orientation :vertical
    filename 'atmega328_vert'
  end

end
