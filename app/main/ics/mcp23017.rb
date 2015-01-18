module MCP23017

  def mcp23017_style
    cmos_style

    title 'MCP23017'
    pins 28
    pin_margin 8
    pin_labels 1 => 'B'.fsub('0'),
      2  => 'B'.fsub('1'),
      3  => 'B'.fsub('2'),
      4  => 'B'.fsub('3'),
      5  => 'B'.fsub('4'),
      6  => 'B'.fsub('5'),
      7  => 'B'.fsub('6'),
      8  => 'B'.fsub('7'),
      9  => Vdd.new,
      10 => Ground.new,
      11 => 'NC'.fbold,
      12 => 'SCL',
      13 => 'SDA',
      14 => 'NC'.fbold,
      15 => 'S'.fsub('0'),
      16 => 'S'.fsub('1'),
      17 => 'S'.fsub('2'),
      18 => 'RST'.overbar,
      19 => 'INT'.fsub('B'),
      20 => 'INT'.fsub('A'),
      21 => 'A'.fsub('0'),
      22 => 'A'.fsub('1'),
      23 => 'A'.fsub('2'),
      24 => 'A'.fsub('3'),
      25 => 'A'.fsub('4'),
      26 => 'A'.fsub('5'),
      27 => 'A'.fsub('6'),
      28 => 'A'.fsub('7')
    pin_colors 1 => :group_1,
      2  => :group_1,
      3  => :group_1,
      4  => :group_1,
      5  => :group_1,
      6  => :group_1,
      7  => :group_1,
      8  => :group_1,
      9  => :vdd,
      10 => :ground,
      11 => :nc,
      12 => :scl,
      13 => :sda,
      14 => :nc,
      15 => :addr,
      16 => :addr,
      17 => :addr,
      18 => :rst,
      19 => :int,
      20 => :int,
      21 => :group_2,
      22 => :group_2,
      23 => :group_2,
      24 => :group_2,
      25 => :group_2,
      26 => :group_2,
      27 => :group_2,
      28 => :group_2
    groups << [1,8]
    groups << [15,17]
    groups << [21,28]
  end

end
