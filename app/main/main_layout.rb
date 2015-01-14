class MainLayout < MK::Layout
  include CD4000
  include CD4017
  include CD4050

  def layout
    background_color :black
    add TO220, :to220
    # add TO92, :to92
    # add CMOS, :cmos_4017
  end

  def to220_style
    background_color :white
    size [387, 150]
    center ['50%', '50%']
    autoresizing_mask :pin_to_center

    title 'LM7805'
    pin_rotation false
    pin_labels 1 => 'Input',
      2 => 'Common',
      3 => 'Output'
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

    pin_margin 10
    chip_width 70
  end

end
