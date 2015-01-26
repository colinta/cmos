module MCP23017

  def mcp23017_style
    cmos_style

    title 'MCP23017'
    desc '16-bit I/O Expander'
    pins 28
    pin_margin 8
    pin_labels 1 => '0'.fsub('B'),
      2  => '1'.fsub('B'),
      3  => '2'.fsub('B'),
      4  => '3'.fsub('B'),
      5  => '4'.fsub('B'),
      6  => '5'.fsub('B'),
      7  => '6'.fsub('B'),
      8  => '7'.fsub('B'),
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
      21 => '0'.fsub('A'),
      22 => '1'.fsub('A'),
      23 => '2'.fsub('A'),
      24 => '3'.fsub('A'),
      25 => '4'.fsub('A'),
      26 => '5'.fsub('A'),
      27 => '6'.fsub('A'),
      28 => '7'.fsub('A')
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
