module CD4017

  def cmos_4017_style
    cmos_style

    pins 16
    pin_margin 12
    pin_labels 1 => 'Q6',
      2  => 'Q2',
      3  => 'Q1',
      4  => 'Q3',
      5  => 'Q7',
      6  => 'Q8',
      7  => 'Q4',
      8  => Ground.new,
      9  => 'Q9',
      10 => 'Q5',
      11 => 'Q10',
      12 => 'CO',
      13 => 'EN'.underbar,
      14 => 'CLK',
      15 => 'RST'.overbar,
      16 => Vdd.new
    pin_colors 1 => '#463cff',
      2 => '#463cff',  # Output
      3 => '#463cff',
      4 => '#463cff',
      5 => '#463cff',
      6 => '#463cff',
      7 => '#463cff',
      8 => :green,  # GND
      9 => '#463cff',
      10=> '#463cff',
      11=> '#463cff',
      12=> '#f9f416', # CO / special function
      13=> '#fd9222', # EN
      14=> '#9d29f9', # CLK
      15=> '#c98651', # RST
      16=> :red  # Vdd
    groups << [1, 7]
    groups << [9, 11]
  end

end
