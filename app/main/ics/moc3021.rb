module MOC3021

  def moc3021_style
    cmos_style

    title 'MOC3021'
    desc 'Optotriac'
    pins 6
    pin_labels 1 => 'I'.fsub('+'),
      2 => 'I'.fsub('-'),
      3 => 'NC',
      4 => '~',
      5 => 'NC',
      6 => '~'
    pin_colors 1 => :in,
      2 => :in,
      3 => :nc,
      4 => :out,
      5 => :nc,
      6 => :out
  end

end
