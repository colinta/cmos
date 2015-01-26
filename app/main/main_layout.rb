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

  include IC_74HC595
  include IC_74HC4067

  include TTL7400
  include TTL7402
  include TTL7408
  include TTL7410
  include TTL7474
  include TTL7486

  include MSGEQ7
  include MCP23017
  include PCF8574
  include LT1302
  include LF353
  include LM741
  include LM358
  include LM386
  include L293D
  include DF04M
  include IC_4N25
  include MOC3021
  include IC_555
  include Attiny85
  include Atmega328

  include LM78xx

  include TM36
  include T_2N7000

  def layout
    background_color :black
    views = []

    add UIControl, :chips do
      views << (add CMOS, :lf353)
      views << (add CMOS, :lf353_vert)
      views << (add CMOS, :lm741)
      views << (add CMOS, :lm741_vert)
      views << (add CMOS, :lm358)
      views << (add CMOS, :lm358_vert)
      views << (add CMOS, :lm386)
      views << (add CMOS, :lm386_vert)
      break

      views << (add CMOS, :ic_74hc595)
      views << (add CMOS, :ic_74hc4067)

      views << (add CMOS, :msgeq7)
      views << (add CMOS, :mcp23017)
      views << (add CMOS, :pcf8574)
      views << (add CMOS, :lt1302)
      views << (add CMOS, :lf353)
      views << (add CMOS, :l293d)
      views << (add CMOS, :df04m)
      views << (add CMOS, :ic_4n25)
      views << (add CMOS, :moc3021)

      views << (add CMOS, :cmos4000)
      views << (add CMOS, :cmos4001)
      views << (add CMOS, :cmos4002)
      views << (add CMOS, :cmos4011)
      views << (add CMOS, :cmos4013)
      views << (add CMOS, :cmos4017)
      views << (add CMOS, :cmos4020)
      views << (add CMOS, :cmos4021)
      views << (add CMOS, :cmos4046)
      views << (add CMOS, :cmos4050)
      views << (add CMOS, :cmos4051)
      views << (add CMOS, :cmos4052)
      views << (add CMOS, :cmos4060)
      views << (add CMOS, :cmos4081)
      views << (add CMOS, :cmos4093)
      views << (add CMOS, :cmos4510)
      views << (add CMOS, :cmos4511)
      views << (add CMOS, :cmos4518)
      views << (add CMOS, :cmos4543)

      views << (add CMOS, :ttl7400)
      views << (add CMOS, :ttl7402)
      views << (add CMOS, :ttl7408)
      views << (add CMOS, :ttl7410)
      views << (add CMOS, :ttl7474)
      views << (add CMOS, :ttl7486)

      views << (add TO220, :lm78xx)

      views << (add TO92, :tm36)
      views << (add TO92, :t_2n7000)
    end

    views.each do |v|
      v.hidden = true
    end
    views[0].hidden = false
  end

  def chips_style
    v = target
    frame :full
    v.on :touch do
      hide_view = v.subviews[0]
      path = "#{hide_view.filename}.png".document_path
      success = hide_view.uiimage.nsdata.write_to(path)
      puts "#{success ? "wrote" : "could not write"} to #{path}"
      hide_view.hidden = true
      hide_view.removeFromSuperview
      v << hide_view

      show_view = v.subviews[0]
      show_view.hidden = false
    end
  end

  def to220_style
    orientation :horizontal
    user_interaction_enabled false
    background_color :white
    size [387, 150]
    center ['50%', '50%']
    autoresizing_mask :pin_to_center
  end

  def to92_style
    orientation :horizontal
    user_interaction_enabled false
    background_color :white
    size [387, 150]
    center ['50%', '50%']
    autoresizing_mask :pin_to_center
  end

  def cmos_style
    orientation :horizontal
    user_interaction_enabled false
    background_color :white
    size [387, 150]
    center ['50%', '50%']
    autoresizing_mask :pin_to_center

    pin_margin 12
    chip_width 66
  end

end
