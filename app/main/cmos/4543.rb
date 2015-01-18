module CD4543

  def cmos_4543_style
    cmos_style

    title 'CD4543'
    pins 16
    pin_labels 1 => 'EN',
      2  => 'C',
      3  => 'B',
      4  => 'D',
      5  => 'A',
      6  => 'PHASE',
      7  => 'BL',
      8  => Ground.new,
      9  => 'a',
      10 => 'b',
      11 => 'c',
      12 => 'd',
      13 => 'e',
      14 => 'g',
      15 => 'f',
      16 => Vdd.new
    pin_colors 1 => :en,
      2  => :in,
      3  => :in,
      4  => :in,
      5  => :in,
      6  => :int,
      7  => :rst,
      8  => :ground,
      9  => :out,
      10 => :out,
      11 => :out,
      12 => :out,
      13 => :out,
      14 => :out,
      15 => :out,
      16 => :vdd
    groups << [2,5]
    groups << [9,15]
  end

end
