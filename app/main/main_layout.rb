class MainLayout < MK::Layout
  include CD4000
  include CD4001
  include CD4002
  include CD4011
  include CD4013
  include CD4017
  include CD4020
  include CD4021
  include CD4046
  include CD4050
  include CD4051
  include CD4052
  include CD4060
  include CD4081
  include CD4093
  include CD4510
  include CD4511
  include CD4518
  include CD4543

  include MSGEQ7
  include MCP23017
  include PCF8574
  include LT1302

  include LM7805

  def layout
    background_color :black
    # add TO220, :lm7805
    # add TO92, :to92
    add CMOS, :lt1302
  end

  def to220_style
    background_color :white
    size [387, 150]
    center ['50%', '50%']
    autoresizing_mask :pin_to_center
  end

  def to92_style
    background_color :white
    size [387, 150]
    center ['50%', '50%']
    autoresizing_mask :pin_to_center
  end

  def cmos_style
    background_color :white
    size [387, 150]
    center ['50%', '50%']
    autoresizing_mask :pin_to_center

    pin_margin 12
    chip_width 72
  end

end
