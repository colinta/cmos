class NSAttributedString

  def formatted(fonts={})
    self
  end

end


class Numeric

  def formatted(fonts={})
    to_s.formatted(fonts)
  end

end


class NSString

  def fsub(txt=nil)
    if txt.nil?
      '[[sub]]' + self + '[[/]]'
    else
      self + '[[sub]]' + txt + '[[/]]'
    end
  end

  def fbold(txt=nil)
    if txt.nil?
      '[[bold]]' + self + '[[/]]'
    else
      self + '[[bold]]' + txt + '[[/]]'
    end
  end

  def overbar
    Label.new(self).overbar
  end

  def underbar
    Label.new(self).underbar
  end

  def formatted(fonts={})
    output = NSMutableAttributedString.new
    scanner = NSScanner.scannerWithString(self)
    scanner.charactersToBeSkipped = nil

    size = UIFont.systemFontSize
    small = UIFont.smallSystemFontSize
    fonts['normal'] ||= { NSFontAttributeName => UIFont.systemFontOfSize(size) }
    fonts['small'] ||= { NSFontAttributeName => UIFont.systemFontOfSize(size) }
    fonts['bold'] ||= { NSFontAttributeName => UIFont.boldSystemFontOfSize(size) }
    fonts['italic'] ||= { NSFontAttributeName => UIFont.italicSystemFontOfSize(size) }
    fonts['super'] ||= fonts['normal'].merge({
      KCTSuperscriptAttributeName => 1,
    })
    fonts['sub'] ||= fonts['normal'].merge({
      KCTSuperscriptAttributeName => -1,
    })
    current = fonts['normal']

    open_formatter = '[['
    close_formatter = ']]'
    buffer = Pointer.new(:object)

    while not scanner.atEnd?
      if scanner.scanUpToString(open_formatter, intoString: buffer)
        output.appendAttributedString(NSAttributedString.alloc.initWithString(buffer[0], attributes: current))
        buffer[0] = nil
      end

      scanner.scanString(open_formatter, intoString: nil)
      if scanner.scanUpToString(close_formatter, intoString: buffer)
        font = fonts[buffer[0]]
        if buffer[0] == '/'
          current = fonts['normal']
        elsif font
          current = font || fonts['normal']
        elsif buffer[0] == '['
          output.appendAttributedString(NSAttributedString.alloc.initWithString('[', attributes: current))
        end

        scanner.scanString(close_formatter, intoString: nil)
      end

      buffer[0] = nil
    end

    return output
  end

end
