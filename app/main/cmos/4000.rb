module CD4000

  def cmos_4000_style
    cmos_style

    title 'CD4000'
    pins 14
    pin_margin 12
    chip_width 72
    pin_labels 1 => '',
      2  => '',
      3  => 'A[[sub]]1[[/]]',
      4  => 'A[[sub]]2[[/]]',
      5  => 'A[[sub]]3[[/]]',
      6  => 'A[[sub]]o[[/]]',
      7  => Ground.new,
      8  => 'I[[sub]]i[[/]]',
      9  => 'I[[sub]]o[[/]]',
      10 => 'B[[sub]]o[[/]]',
      11 => 'B[[sub]]1[[/]]',
      12 => 'B[[sub]]2[[/]]',
      13 => 'B[[sub]]3[[/]]',
      14 => Vdd.new
    pin_colors 1 => :dark_gray,
      2 => :dark_gray,
      3 => '#6b5cff', # A1
      4 => '#6b5cff', # A2
      5 => '#6b5cff', # A3
      6 => '#463cff', # Ao
      7 => :green,
      8 => '#f9fa84', # Ii
      9 => '#f9f416', # Io
      10=> '#fd9222', # Bo
      11=> '#faa350', # B1
      12=> '#faa350', # B2
      13=> '#faa350', # B3
      14=> :red
    groups << [3, 5]
    groups << [11, 13]
  end

end
