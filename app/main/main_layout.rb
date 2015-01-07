class MainLayout < MK::Layout

  def layout
    background_color :black
    add CMOS, :cmos
  end

  def cmos_style
    background_color :white
    size [387, 150]
    center ['50%', '50%']
    autoresizing_mask :pin_to_center

    title 'CD4050'
    pins 8
    pin_labels 1 => Vdd.new,
      2  => 'A[[sub]]o[[/]]',
      3  => 'A[[sub]]i[[/]]',
      4  => 'B[[sub]]o[[/]]',
      5  => 'B[[sub]]i[[/]]',
      6  => 'C[[sub]]o[[/]]',
      7  => 'C[[sub]]i[[/]]',
      8  => Ground.new,
      9  => 'D[[sub]]i[[/]]',
      10 => 'D[[sub]]o[[/]]',
      11 => 'E[[sub]]i[[/]]',
      12 => 'E[[sub]]o[[/]]',
      13 => '[[bold]]NC[[/]]',
      14 => 'F[[sub]]i[[/]]',
      15 => 'F[[sub]]o[[/]]',
      16 => '[[bold]]NC[[/]]'
    pin_colors 1 => :red,  # Vdd
      8  => :green,        # GND
      2 => '#463cff', # Ao
      3 => '#6b5cff', # Ai
      4 => '#fd9222', # Bo
      5 => '#faa350', # Bi
      6 => '#f9f416', # Co
      7 => '#f9fa84', # Ci
      9 => '#9d29f9', # Di
      10=> '#8e00f9', # Do
      11=> '#c98651', # Ei
      12=> '#ab5b17', # Eo
      14=> '#4fc639', # Fi
      15=> '#29a514', # Fo
      13 => :dark_gray,  # NC
      16 => :dark_gray   # NC
    groups << [2, 3]
    groups << [4, 5]
    groups << [6, 7]
    groups << [9, 10]
    groups << [11, 12]
    groups << [14, 15]
  end

end
