class AppDelegate
  def application(application, didFinishLaunchingWithOptions: options)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    main_ctlr = MainController.new
    @window.rootViewController = MainController.new
    @window.makeKeyAndVisible

    true
  end
end
