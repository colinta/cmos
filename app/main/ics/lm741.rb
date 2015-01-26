module LM741

  def lm741_style
    cmos_style

    title 'LM741'
    desc 'Op-Amp'
    pins 8
    pin_margin 10
    pin_labels 1 => 'Off',
      2  => '-',
      3  => '+',
      4  => Ground.new,
      5  => 'Off',
      6  => 'O',
      7  => Vdd.new,
      8  => 'NC'
    pin_colors 1 => :data,
      2 => :a_in,
      3 => :a_in,
      4 => :ground,
      5 => :data,
      6 => :out,
      7 => :vdd,
      8 => :nc
    groups << [2,3]
    groups << [6,6]
  end

  def lm741_vert_style
    lm741_style
    orientation :vertical
    filename 'LM741_vert'
  end

end
