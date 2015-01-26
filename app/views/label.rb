class Label
  attr_accessor :text

  def overbar(val=true)
    @overbar = val
    self
  end

  def overbar?
    @overbar
  end

  def underbar(val=true)
    @underbar = val
    self
  end

  def underbar?
    @underbar
  end

  def initialize(text=nil)
    @text = text
  end

end
