module LM386

  def lm386_style
    cmos_style

    title 'LM386'
    desc 'Audio Amp'
    pins 8
    pin_margin 10
    pin_labels 1 => 'GAIN',
      2  => '-',
      3  => '+',
      4  => Ground.new,
      5  => 'OUT',
      6  => Vdd.new,
      7  => 'BYPASS',
      8  => 'GAIN'
    pin_colors 1 => :addr,
      2 => :in,
      3 => :in,
      4 => :ground,
      5 => :out,
      6 => :vdd,
      7 => :data,
      8 => :addr
    groups << [2,3]
    groups << [5,5]
  end

  def lm386_vert_style
    lm386_style
    orientation :vertical
    filename 'LM386_vert'
  end

end
