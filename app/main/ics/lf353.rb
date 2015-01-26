module LF353

  def lf353_style
    cmos_style

    title 'LF353'
    desc 'Dual Op-Amp'
    pins 8
    pin_margin 10
    pin_labels 1 => 'O'.fsub('A'),
      2  => '-',
      3  => '+',
      4  => Ground.new,
      5  => '+',
      6  => '-',
      7  => 'O'.fsub('B'),
      8  => Vdd.new
    pin_colors 1 => :a_out,
      2 => :a_in,
      3 => :a_in,
      4 => :ground,
      5 => :b_in,
      6 => :b_in,
      7 => :b_out,
      8 => :vdd
    groups << [1,3]
    groups << [5,7]
  end

  def lf353_vert_style
    lf353_style
    orientation :vertical
    filename 'LF353_vert'
  end

end
