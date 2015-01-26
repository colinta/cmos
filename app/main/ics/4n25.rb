module IC_4N25

  def ic_4n25_style
    cmos_style

    title '4N25'
    desc 'Optoisolator'
    pins 6
    pin_labels 1 => 'I'.fsub('+'),
      2 => 'I'.fsub('-'),
      3 => 'NC'.fbold,
      4 => 'E',
      5 => 'C',
      6 => 'B'
    pin_colors 1 => :in,
      2 => :in,
      3 => :nc,
      4 => :out,
      5 => :out,
      6 => :nc
  end

end
