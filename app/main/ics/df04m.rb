module DF04M

  def df04m_style
    cmos_style

    title 'DF04M'
    desc "Bridge\nRectifier"
    pins 4
    pin_labels 1 => 'V'.fsub('+'),
      2 => 'V'.fsub('-'),
      3 => '~',
      4 => '~'
    pin_colors 1 => :out,
      2 => :out,
      3 => :in,
      4 => :in
  end

end
