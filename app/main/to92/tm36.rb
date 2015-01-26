module TM36

  def tm36_style
    to92_style

    title 'TM36'
    desc 'Temperature Sensor'
    pin_rotation false
    pin_labels 1 => Ground.new,
      2 => 'Output',
      3 => Vdd.new
  end

end
