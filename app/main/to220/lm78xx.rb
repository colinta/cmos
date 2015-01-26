module LM78xx

  def lm78xx_style
    to220_style

    title 'LM78xx'
    desc 'Power Regulator'
    pin_rotation false
    pin_labels 1 => 'Input',
      2 => 'Common',
      3 => 'Output'
  end

end
