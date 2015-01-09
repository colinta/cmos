class MainLayout < MK::Layout
  include CD4000
  include CD4017
  include CD4050

  def layout
    background_color :black
    add CMOS, :cmos_4017
  end

  def cmos_style
    background_color :white
    size [387, 150]
    center ['50%', '50%']
    autoresizing_mask :pin_to_center

    pin_margin 10
    chip_width 70
  end

end
