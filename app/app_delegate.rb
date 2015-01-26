class AppDelegate
  def application(application, didFinishLaunchingWithOptions: options)
    define_colors
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    main_ctlr = MainController.new
    @window.rootViewController = MainController.new
    @window.makeKeyAndVisible

    true
  end

  def define_colors
    Symbol.css_colors[:ground] = UIColor.greenColor
    Symbol.css_colors[:vdd] = UIColor.redColor
    Symbol.css_colors[:vss] = UIColor.blueColor
    Symbol.css_colors[:nc] = UIColor.darkGrayColor

    Symbol.css_colors[:out] = '#fd9222'.uicolor
    Symbol.css_colors[:in] = '#21dc57'.uicolor
    Symbol.css_colors[:en] = '#35b8ff'.uicolor
    Symbol.css_colors[:int] = '#35b8ff'.uicolor
    Symbol.css_colors[:co] = '#f9f416'.uicolor
    Symbol.css_colors[:clk] = '#9d29f9'.uicolor
    Symbol.css_colors[:rst] = '#c98651'.uicolor
    Symbol.css_colors[:data] = '#fbc825'.uicolor
    Symbol.css_colors[:sda] = '#fbc825'.uicolor
    Symbol.css_colors[:scl] = '#f8b409'.uicolor
    Symbol.css_colors[:addr] = '#a6d6a5'.uicolor

    Symbol.css_colors[:a_in] = '#6b5cff'.uicolor
    Symbol.css_colors[:a_out] = '#463cff'.uicolor
    Symbol.css_colors[:b_in] = '#faa350'.uicolor
    Symbol.css_colors[:b_out] = '#fd9222'.uicolor
    Symbol.css_colors[:c_in] = '#f9fa84'.uicolor
    Symbol.css_colors[:c_out] = '#f9f416'.uicolor
    Symbol.css_colors[:d_in] = '#9d29f9'.uicolor
    Symbol.css_colors[:d_out] = '#8e00f9'.uicolor
    Symbol.css_colors[:e_in] = '#c98651'.uicolor
    Symbol.css_colors[:e_out] = '#ab5b17'.uicolor
    Symbol.css_colors[:f_in] = '#4fc639'.uicolor
    Symbol.css_colors[:f_out] = '#29a514'.uicolor

    Symbol.css_colors[:group_1] = '#463cff'.uicolor
    Symbol.css_colors[:group_2] = '#fd9222'.uicolor
    Symbol.css_colors[:group_3] = '#f9f416'.uicolor
    Symbol.css_colors[:group_4] = '#8e00f9'.uicolor
    Symbol.css_colors[:group_5] = '#ab5b17'.uicolor
    Symbol.css_colors[:group_6] = '#29a514'.uicolor
    Symbol.css_colors[:group_7] = '#83e224'.uicolor
    Symbol.css_colors[:group_8] = '#fc5111'.uicolor
    Symbol.css_colors[:group_9] = '#f900a3'.uicolor
    Symbol.css_colors[:group_10] = '#dd0058'.uicolor
  end

end
